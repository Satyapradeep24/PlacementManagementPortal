<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Job Openings</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">All Job Openings</h2>

                <c:if test="${not empty jobNotifications}">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Job Title</th>
                                <th>Company</th>
                                <th>Location</th>
                                <th>Job Type</th>
                                <th>Deadline</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="job" items="${jobNotifications}">
                                <tr>
                                    <td>${job.id}</td>
                                    <td>${job.jobTitle}</td>
                                    <td>${job.company}</td>
                                    <td>${job.location}</td>
                                    <td>${job.jobType}</td>
                                    <td>${job.deadline}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${job.status == 'ACTIVE'}">
                                                <span class="badge bg-success">Active</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Closed</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="viewJobDetails?id=${job.id}" class="btn btn-info btn-sm">View</a>
                                        <a href="editJobOpening?id=${job.id}" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="deleteJobOpening?id=${job.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this job?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty jobNotifications}">
                    <div class="alert alert-warning text-center">
                        No Job Openings Found
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
