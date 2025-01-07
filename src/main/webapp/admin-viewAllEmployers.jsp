<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
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
                <h2 class="text-center mb-5">All Employers</h2>

                <c:if test="${not empty employers}">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Company Name</th>
                                <th>Contact Person</th>
                                <th>Contact Email</th>
                                <th>Contact Phone</th>
                                <th>Industry Type</th>
                                <th>Website</th>
                                <th>Verified</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="employer" items="${employers}">
                                <tr>
                                    <td>${employer.id}</td>
                                    <td>${employer.companyName}</td>
                                    <td>${employer.contactPerson}</td>
                                    <td>${employer.contactEmail}</td>
                                    <td>${employer.contactPhone}</td>
                                    <td>${employer.industryType}</td>
                                    <td>
                                        <a href="${employer.website}" target="_blank">${employer.website}</a>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${employer.verified}">
                                                <span class="badge bg-success">Verified</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger">Not Verified</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="viewEmployerProfile?id=${employer.id}" class="btn btn-info btn-sm">View</a>
                                        <a href="editEmployerProfile?id=${employer.id}" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="deleteEmployer?id=${employer.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this employer?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty employers}">
                    <div class="alert alert-warning text-center">
                        No Employers Found
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
