/**
 * 
 */
$(document).ready(function() {
		
		$("#customerForm").validate({
			rules: {
				email:{
					required: true,
					email: true
				},
				firstName: "required",
				lastName: "required",
				password: "required",
				confirmPassword: {
					required: true,
					equalTo: "#password"
				},
				phone: "required",
				addressLine1: "required",
				city:"required",
				state:"required",
				zipcode: "required",
				country:"required",
			},
			
			messages: {

				email:{
					required: "Please enter an e-mail address",
					email: "Please enter a valid e-mail address"
					},
				firstName: "Please enter First Name",
				lastName: "Please enter Last Name",
				password: "Please confirm Password",
				confirmPassword: {
					required: "Please enter Password",
					equalTo: "Confirm password does not math password"
				},
				phone: "Please enter phone number ",
				addressLine1: "please enter street address",
				city:"please enter city",
				state:"please enter state or province",
				zipcode: "please enter zipcode",
				country:"please enter country",
			}
		});
		
		$("#buttonCancel").click(function() {
			history.go(-1);
		});
	});
	
	function showImageThumbnail(fileInput){
		var file = fileInput.files[0];
		
		var reader = new FileReader();
		
		reader.onload = function(e){
			$('#thumbnail').attr('src', e.target.result);
		};
		reader.readAsDataURL(file);
	}