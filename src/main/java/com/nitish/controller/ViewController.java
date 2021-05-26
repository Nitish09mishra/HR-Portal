package com.nitish.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.nitish.model.EmployeeModel;
import com.nitish.model.UserModel;
import com.nitish.services.UserService;

@Controller
public class ViewController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RestTemplate restTemplate;

	// ....................................................login page handler..................................
	@RequestMapping("/")
	public String loginPageHandler(HttpServletRequest request) {
		System.out.print("Inside Home page resolver !!!");

		return "index";
	}

	// ....................................................signup page handler.................................
	@RequestMapping("/signup")
	public String signupPageHandler(HttpServletRequest request) {
		System.out.println("Inside Signup page resolver !!!");
		
		return "signup";
	}
	
	// ....................................................home page handler...................................
	@RequestMapping("/home")
	public String homePageHandler( HttpServletRequest request, Model model) {
		System.out.println("Inside Home page resolver !!!");
		
		try {
			ResponseEntity<EmployeeModel[]> response = restTemplate.getForEntity("http://localhost:9090/employees", EmployeeModel[].class);
			EmployeeModel[] employees= response.getBody();
			model.addAttribute("employees", employees);
		}
		catch(Exception e) {
			e.printStackTrace();
			 System.out.println("Error:-" + e.getMessage());
		}
		
		return "home";
	}
	
	// ....................................................create page handler...................................
	@RequestMapping("/create")
	public String createPageHandler( HttpServletRequest request) {
		System.out.println("Inside Create page resolver !!!");
		return "create";
	}
	
	// ....................................................update page handler.................................
	@RequestMapping("/update")
	public String updateEmployeeHandler(HttpServletRequest request, Model model,  @RequestParam String Id) {
		System.out.println("Inside Update page resolver !!!");
		
		try {
//			System.out.println("\n inside try..");
			ResponseEntity<EmployeeModel> response = restTemplate.getForEntity("http://localhost:9090/employees/get/"+Id, EmployeeModel.class);			
//			System.out.println("inside try 2..");
			EmployeeModel employee= response.getBody();	
//			System.out.println("Current employee= "+ employee+" .....   ");			
			model.addAttribute("current_employee", employee);
		}
		catch(Exception e) {
			e.printStackTrace();
			 System.out.println("Error:-" + e.getMessage());
		}
		
		return "update";
	}
		
	// ......................................................handler method for signin.............................
	@RequestMapping(path = "/processSignin", method = RequestMethod.POST)
	public String handleSigninForm(@ModelAttribute UserModel user, Model model, HttpServletRequest request) {
		System.out.println(" Inside signin handler  ");

		boolean u = this.userService.findUser(user);

		if (!u) {
			HttpSession session = request.getSession();
			session.setAttribute("name", user.getUserid());
			session.setAttribute("success", "You have loggedin successfully");
			
			// redirecting to home page
			return "redirect:/home";
		}

		HttpSession session = request.getSession();
		session.setAttribute("error", "User Id or password not matching");
		// redirecting to index page
		return "index";
	}

	
	

	// ........................................................handler method for signup.........................
	@RequestMapping(path = "/processSignup", method = RequestMethod.POST)
	public String handleSignupForm(@ModelAttribute UserModel user, Model model, HttpServletRequest request) {

		this.userService.createUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("success", "User created successfully !!!");
		
		// redirecting to home page
		return "index";
	}
	
	// .........................................................handler method for updating user................
		@RequestMapping(path = "/processCreate", method = RequestMethod.POST)
		public String handleCreateForm(@ModelAttribute EmployeeModel empl, Model model, HttpServletRequest request) {

			try {			
				// System.out.println("EMP= "+empl);
				empl.setId(5000);
				HttpHeaders headers = new HttpHeaders();//creating headers to store data
				headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
				HttpEntity<EmployeeModel> entity = new HttpEntity<EmployeeModel>(empl, headers);
				
				restTemplate.postForEntity("http://localhost:9090/", entity, EmployeeModel.class).getBody();				
			}
			catch(Exception e) {
				e.printStackTrace();
				 System.out.println("Error:-" + e.getMessage());
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("success", "New employee added successfully !!!");
			
			// redirecting to home page
			return "redirect:/home";
		}
		
	// .........................................................handler method for updating user................
	@RequestMapping(path = "/processUpdate", method = RequestMethod.POST)
	public String handleUpdateForm(@ModelAttribute EmployeeModel empl, Model model, HttpServletRequest request) {

		try {			
//			System.out.println("EMP= "+empl);
			HttpHeaders headers = new HttpHeaders();//creating headers to store data
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<EmployeeModel> entity = new HttpEntity<EmployeeModel>(empl, headers);
			
			restTemplate.postForEntity("http://localhost:9090/", entity, EmployeeModel.class).getBody();				
			
			HttpSession session = request.getSession();
			session.setAttribute("success", "Employee details updated successfully !!!");
		}
		catch(Exception e) {
			e.printStackTrace();
			 System.out.println("Error:-" + e.getMessage());
		}
		
		
		// redirecting to home page
		return "redirect:/home";
	}
	
	
	// .........................................................logout method for logout........................
	@RequestMapping(path = "/processLogout",  method = RequestMethod.GET)
	public String logoutHandler(HttpServletRequest request) {
		
		HttpSession session= request.getSession();
        session.invalidate();
        System.out.println("Name= "+ request.getAttribute("name"));
		return "redirect:/index";
	}

}
