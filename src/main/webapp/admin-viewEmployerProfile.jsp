<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Profile</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">Employer Profile</h2>

                <c:if test="${not empty employer}">
                    <div class="card">
                        <div class="card-header">
                            <h4>${employer.companyName}</h4>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <tr>
                                    <th>ID</th>
                                    <td>${employer.id}</td>
                                </tr>
                                <tr>
                                    <th>Company Name</th>
                                    <td>${employer.companyName}</td>
                                </tr>
                                <tr>
                                    <th>Contact Person</th>
                                    <td>${employer.contactPerson}</td>
                                </tr>
                                <tr>
                                    <th>Contact Email</th>
                                    <td>${employer.contactEmail}</td>
                                </tr>
                                <tr>
                                    <th>Contact Phone</th>
                                    <td>${employer.contactPhone}</td>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <td>${employer.address}</td>
                                </tr>
                                <tr>
                                    <th>Website</th>
                                    <td>
                                        <a href="${employer.website}" target="_blank">${employer.website}</a>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Industry Type</th>
                                    <td>${employer.industryType}</td>
                                </tr>
                                <tr>
                                    <th>Verified</th>
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
                                </tr>
                                <tr>
                                    <th>Username</th>
                                    <td>${employer.username}</td>
                                </tr>
                            </table>
                        </div>
                        <div class="card-footer text-center">
                            <a href="editEmployerProfile?id=${employer.id}" class="btn btn-warning">Edit</a>
                            <a href="deleteEmployer?id=${employer.id}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this employer?');">Delete</a>
                        </div>
                    </div>
                </c:if>

                <c:if test="${empty employer}">
                    <div class="alert alert-danger text-center">
                        Employer not found.
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
