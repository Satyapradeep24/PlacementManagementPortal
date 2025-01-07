<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Student Registration</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
</head>

<body class="login-body">

    <div class="container">

        <form class="form-signin" action="registerStudent" method="POST">
            <h2 class="form-signin-heading">Register Now</h2>
            <div th:if="${errorMessage}" class="alert alert-danger">
                <p th:text="${errorMessage}"></p>
            </div>
            <c:if test="${not empty errorMessage}">
			    <div class="alert alert-danger">
			        <c:out value="${errorMessage}" />
			    </div>
			</c:if>
            
            <div class="login-wrap">
                <p>Enter your personal details below</p>
                <input type="text" class="form-control" name="name" placeholder="Full Name" required autofocus>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                <input type="password" class="form-control" name="rePassword" placeholder="Re-type Password" required>

                <!-- Optional fields -->
                <input type="text" class="form-control" name="address" placeholder="Address">
                <input type="text" class="form-control" name="phoneNumber" placeholder="Phone Number">
                <input type="text" class="form-control" name="dateOfBirth" placeholder="Date of Birth">
                
                <div class="radios">
                    <label class="label_radio col-lg-6 col-sm-6" for="radio-01">
                        <input name="gender" id="radio-01" value="Male" type="radio" /> Male
                    </label>
                    <label class="label_radio col-lg-6 col-sm-6" for="radio-02">
                        <input name="gender" id="radio-02" value="Female" type="radio" /> Female
                    </label>
                </div>
                
                <input type="text" class="form-control" name="registrationNumber" placeholder="Registration Number">
                <input type="text" class="form-control" name="department" placeholder="Department">
                <input type="number" class="form-control" name="yearOfStudy" placeholder="Year of Study">
                <input type="number" step="0.1" class="form-control" name="cgpa" placeholder="CGPA">
                <input type="text" class="form-control" name="resumeUrl" placeholder="Resume URL">
                <input type="text" class="form-control" name="placementStatus" placeholder="Placement Status">
                <input type="number" class="form-control" name="backlogs" placeholder="Backlogs">
                
                

                <label class="checkbox">
                    <input type="checkbox" value="agree this condition" required> I agree to the Terms of Service and Privacy Policy
                </label>
                <button class="btn btn-lg btn-login btn-block" type="submit">Submit</button>

                <div class="registration">
                    Already Registered.
                    <a class="" href="studentLogin">
                        Login
                    </a>
                </div>

            </div>

        </form>

    </div>


</body>

</html>
