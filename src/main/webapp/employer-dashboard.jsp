<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<%

Employer currentEmployer = (Employer) session.getAttribute("employer");

if (currentEmployer == null) {
    response.sendRedirect("employerLogin");
}
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employer Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>

<%@ include file="employer-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <!-- Employer Profile Section -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>

        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-user"></i> Employer Profile
                    </header>
                    <div class="card-body">
                        <p><strong>Company Name:</strong> <c:out value="${employer.companyName}" /></p>
                        <p><strong>Contact Person:</strong> <c:out value="${employer.contactPerson}" /></p>
                        <p><strong>Email:</strong> <c:out value="${employer.contactEmail}" /></p>
                        <p><strong>Phone:</strong> <c:out value="${employer.contactPhone}" /></p>
                        <p><strong>Website:</strong> <c:out value="${employer.website}" /></p>
                        <p><strong>Industry Type:</strong> <c:out value="${employer.industryType}" /></p>
                    </div>
                </section>
            </div>
        </div>

        <!-- Posted Jobs Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-briefcase"></i> Posted Jobs
                    </header>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Job Title</th>
                                    <th>Location</th>
                                    <th>Status</th>
                                    <th>Applications</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${postedJobs}">
                                    <tr>
                                        <td><c:out value="${job.jobTitle}" /></td>
                                        <td><c:out value="${job.location}" /></td>
                                        <td><c:out value="${job.status}" /></td>
                                        <td><c:out value="${job.applicants.size()}" /></td>
                                        <td>
                                            <a href="viewJobApplications?jobId=${job.id}" class="btn btn-info btn-sm">
                                                View Applications
                                            </a>
                                            <a href="editJob?jobId=${job.id}" class="btn btn-warning btn-sm">
                                                Edit Job
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>

        <!-- Applications for Jobs Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-users"></i> Applicants
                    </header>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Applicant Name</th>
                                    <th>Email</th>
                                    <th>Job Applied</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="application" items="${applications}">
                                    <tr>
                                        <td><c:out value="${application.applicantName}" /></td>
                                        <td><c:out value="${application.email}" /></td>
                                        <td><c:out value="${application.jobTitle}" /></td>
                                        <td><c:out value="${application.status}" /></td>
                                        <td>
                                            <a href="viewApplicationDetails?applicationId=${application.id}" class="btn btn-primary btn-sm">
                                                View Details
                                            </a>
                                            <a href="updateApplicationStatus?applicationId=${application.id}" class="btn btn-success btn-sm">
                                                Update Status
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>

<footer class="site-footer">
    <div class="text-center">
        2024 &copy; Employer Dashboard
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
