<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@page import="com.klef.jfsd.springboot.model.JobNotification"%>
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
    <title>Employer Dashboard - Job Posting</title>
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
        <!-- Job Posting Form Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-briefcase"></i> Post a Job
                    </header>
                    <div class="card-body">
                        <form action="createJobNotification" method="post">
                            <div class="form-group">
                                <label for="jobTitle">Job Title</label>
                                <input type="text" class="form-control" id="jobTitle" name="jobTitle" required />
                            </div>
                            <div class="form-group">
                                <label for="jobDescription">Job Description</label>
                                <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="jobType">Job Type</label>
                                <select class="form-control" id="jobType" name="jobType" required>
                                    <option value="Full-time">Full-time</option>
                                    <option value="Part-time">Part-time</option>
                                    <option value="Internship">Internship</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="location">Location</label>
                                <input type="text" class="form-control" id="location" name="location" required />
                            </div>
                            <div class="form-group">
                                <label for="contactEmail">Contact Email</label>
                                <input type="email" class="form-control" id="contactEmail" name="contactEmail" required />
                            </div>
                            <div class="form-group">
                                <label for="qualifications">Qualifications</label>
                                <textarea class="form-control" id="qualifications" name="qualifications" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="skillsRequired">Skills Required</label>
                                <textarea class="form-control" id="skillsRequired" name="skillsRequired" rows="3" required></textarea>
                            </div>
                            <div class="form-group">
                                <label for="deadline">Application Deadline</label>
                                <input type="date" class="form-control" id="deadline" name="deadline" required />
                            </div>
                            <button type="submit" class="btn btn-primary">Post Job</button>
                        </form>
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
                                    <!-- <th>Applications</th> -->
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${postedJobs}">
                                    <tr>
                                        <td><c:out value="${job.jobTitle}" /></td>
                                        <td><c:out value="${job.location}" /></td>
                                        <td><c:out value="${job.status}" /></td>
                                        <%-- <td><c:out value="${job.applications.size()}" /></td> --%>
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
    </section>
</section>

<!-- <footer class="site-footer">
    <div class="text-center">
        2024 &copy; Employer Dashboard
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer> -->

<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/common-scripts.js"></script>

</body>

</html>
