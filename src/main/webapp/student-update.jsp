<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<%

Student currentStudent = (Student) session.getAttribute("student");

if(currentStudent==null){
	response.sendRedirect("studentLogin");
}
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Profile</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
</head>

<%@ include file="student-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-user"></i> Update Profile
                    </header>
                    <div class="card-body">
                        <form action="/updateStudentProfile" method="post">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control" id="name" name="name" value="${student.name}" required />
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="${student.email}" required />
                            </div>
                            <div class="form-group">
                                <label for="phoneNumber">Phone Number</label>
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${student.phoneNumber}" />
                            </div>
                            <div class="form-group">
                                <label for="department">Department</label>
                                <input type="text" class="form-control" id="department" name="department" value="${student.department}" />
                            </div>
                            <div class="form-group">
                                <label for="yearOfStudy">Year of Study</label>
                                <input type="number" class="form-control" id="yearOfStudy" name="yearOfStudy" value="${student.yearOfStudy}" />
                            </div>
                            <div class="form-group">
                                <label for="cgpa">CGPA</label>
                                <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" value="${student.cgpa}" />
                            </div>
                            <div class="form-group">
                                <label for="skills">Skills</label>
                                <input type="text" class="form-control" id="skills" name="skills" value="${student.skills}" />
                            </div>
                            <div class="form-group">
                                <label for="resumeUrl">Resume URL</label>
                                <input type="text" class="form-control" id="resumeUrl" name="resumeUrl" value="${student.resumeUrl}" />
                            </div>
                            <div class="form-group">
                                <label for="internshipExperience">Internship Experience</label>
                                <textarea class="form-control" id="internshipExperience" name="internshipExperience">${student.internshipExperience}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="password">Password (Optional)</label>
                                <input type="password" class="form-control" id="password" name="password" />
                            </div>
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>

<footer class="site-footer">
    <div class="text-center">
        2024 &copy; Student Dashboard
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/common-scripts.js"></script>

</body>
</html>
