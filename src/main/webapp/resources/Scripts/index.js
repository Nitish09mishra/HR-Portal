
// alert box closing functions...
function colse_1() {
	setTimeout(function() {
	}, 3000)
	document.getElementById("index_success").style.display="none";
}

function colse_2() {
	setTimeout(function() {
	}, 3000)
	document.getElementById("index_error").style.display="none";
}

function colse_3() {
	setTimeout(function() {
	}, 3000)
	document.getElementById("home_success").style.display="none";
}

//reset functions...
function reset_1() {
	document.getElementById('create_reset').reset();
}

function reset_2() {
	document.getElementById('update_reset').reset();
}

//download employees details table...
function download() {
	const employees= document.getElementById('empl_table');
	var opt = {
			filename: 'Employees-Details.pdf'
	}
	html2pdf().from(employees).set(opt).save();
}

