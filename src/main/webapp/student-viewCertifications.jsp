<%@ page import="com.klef.jfsd.springboot.model.Student" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%

Student currentStudent = (Student) session.getAttribute("student");

if (currentStudent == null) {
    response.sendRedirect("studentLogin");
    return;
}

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Certifications</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>

<%@ include file="student-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <!-- Student Profile Section -->
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-user"></i> Student Profile
                    </header>
                    <div class="card-body">
                        <p><strong>Student Name:</strong> <c:out value="${currentStudent.name}" /></p>
                        <p><strong>University ID:</strong> <c:out value="${currentStudent.registrationNumber}" /></p>
                        <p><strong>Department Name:</strong> <c:out value="${currentStudent.department}" /></p>
                        <!-- Add other student information as required -->
                    </div>
                </section>
            </div>
        </div>

        <!-- Certifications Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <h3>Your Certifications</h3>
                    </header>
                    <div class="card-body">
                        <h5>All Completed Certifications:</h5>
                        <ul class="certification-list">
                            <!-- Loop through certifications passed from the controller -->
                            <c:forEach var="certification" items="${certifications}">
                                <li>
                                    <span style="font-size: 18px; font-weight: bold; color: #333;">${certification}</span>
                                    <!-- Option to remove a certification -->
                                    <form action="removeCertification" method="POST" style="display:inline;">
                                        <input type="hidden" name="certification" value="${certification}">
                                        <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                    </form>
                                </li>
                            </c:forEach>
                        </ul>

                        <h5>Add New Certification:</h5>
                        <form action="addCertification" method="POST">
                            <div class="form-group">
                                <label for="certification">Certification Name</label>
                                <input type="text" class="form-control" id="certification" name="certification" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Certification</button>
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
