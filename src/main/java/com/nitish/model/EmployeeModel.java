package com.nitish.model;

public class EmployeeModel {

	private int id;
	private String name;
	private String location;
	private String email;
	private String dob;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	
	
	/**
	 * @param id
	 * @param name
	 * @param location
	 * @param email
	 * @param dob
	 */
	public EmployeeModel(int id, String name, String location, String email, String dob) {
		this.id = id;
		this.name = name;
		this.location = location;
		this.email = email;
		this.dob = dob;
	}
	
	public EmployeeModel() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	@Override
	public String toString() {
		return "EmployeeModel [id=" + id + ", name=" + name + ", location=" + location + ", email=" + email + ", dob="
				+ dob + "]";
	}
	
}
