<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">Student Profile</h2>

                <c:if test="${not empty student}">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">${student.name}</h5>
                            <p class="card-text"><strong>Email:</strong> ${student.email}</p>
                            <p class="card-text"><strong>Phone Number:</strong> ${student.phoneNumber}</p>
                            <p class="card-text"><strong>Department:</strong> ${student.department}</p>
                            <p class="card-text"><strong>Year of Study:</strong> ${student.yearOfStudy}</p>
                            <p class="card-text"><strong>CGPA:</strong> ${student.cgpa}</p>
                            <p class="card-text"><strong>Skills:</strong></p>
                            <ul>
                                <c:forEach var="skill" items="${student.skills}">
                                    <li>${skill}</li>
                                </c:forEach>
                            </ul>
                            <p class="card-text"><strong>Applied Companies:</strong></p>
                            <ul>
                                <c:forEach var="company" items="${student.appliedCompanies}">
                                    <li>${company}</li>
                                </c:forEach>
                            </ul>
                            <p class="card-text"><strong>Placement Status:</strong> ${student.placementStatus}</p>
                            <p class="card-text"><strong>Backlogs:</strong> ${student.backlogs}</p>
                            <p class="card-text"><strong>Certifications:</strong></p>
                            <ul>
                                <c:forEach var="certification" items="${student.certifications}">
                                    <li>${certification}</li>
                                </c:forEach>
                            </ul>
                            <p class="card-text"><strong>Projects:</strong></p>
                            <ul>
                                <c:forEach var="project" items="${student.projects}">
                                    <li>${project}</li>
                                </c:forEach>
                            </ul>
                            <p class="card-text"><strong>Internship Experience:</strong> ${student.internshipExperience}</p>
                            <p class="card-text"><strong>Achievements:</strong></p>
                            <ul>
                                <c:forEach var="achievement" items="${student.achievements}">
                                    <li>${achievement}</li>
                                </c:forEach>
                            </ul>

                            <a href="adminViewAllStudents" class="btn btn-primary">Back to Student List</a>
                        </div>
                    </div>
                </c:if>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">
                        ${errorMessage}
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
