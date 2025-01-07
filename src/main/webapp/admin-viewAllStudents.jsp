<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<%
Admin currentAdmin = (Admin) session.getAttribute("admin");

if (currentAdmin == null) {
    response.sendRedirect("adminLogin");
}
%>

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Students</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">All Students</h2>

                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">
                        ${successMessage}
                    </div>
                </c:if>

                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>Department</th>
                                <th>Year of Study</th>
                                <th>CGPA</th>
                                <th>Skills</th>
                                <th>Applied Companies</th>
                                <th>Placement Status</th>
                                <th>Backlogs</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.id}</td>
                                    <td>${student.name}</td>
                                    <td>${student.email}</td>
                                    <td>${student.phoneNumber}</td>
                                    <td>${student.department}</td>
                                    <td>${student.yearOfStudy}</td>
                                    <td>${student.cgpa}</td>
                                    <td>
                                        <ul>
                                            <c:forEach var="skill" items="${student.skills}">
                                                <li>${skill}</li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul>
                                            <c:forEach var="company" items="${student.appliedCompanies}">
                                                <li>${company}</li>
                                            </c:forEach>
                                        </ul>
                                    </td>
                                    <td>${student.placementStatus}</td>
                                    <td>${student.backlogs}</td>
                                    <td>
                                        <a href="viewStudentProfile?id=${student.id}" class="btn btn-info btn-sm">View</a>
                                        <a href="editStudentProfile?id=${student.id}" class="btn btn-warning btn-sm">Edit</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
