<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Details</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">Job Details</h2>
                <c:if test="${not empty job}">
                    <div class="card">
                        <div class="card-header">
                            <h3>${job.jobTitle}</h3>
                        </div>
                        <div class="card-body">
                            <p><strong>Company:</strong> ${job.company}</p>
                            <p><strong>Job Description:</strong> ${job.jobDescription}</p>
                            <p><strong>Job Type:</strong> ${job.jobType}</p>
                            <p><strong>Location:</strong> ${job.location}</p>
                            <p><strong>Contact Email:</strong> ${job.contactEmail}</p>
                            <p><strong>Qualifications Required:</strong> ${job.qualifications}</p>
                            <p><strong>Skills Required:</strong> ${job.skillsRequired}</p>
                            <p><strong>Deadline:</strong> ${job.deadline}</p>
                            <p><strong>Posted Date:</strong> ${job.postedDate}</p>
                            <p><strong>Status:</strong> 
                                <c:choose>
                                    <c:when test="${job.status == 'Open'}">
                                        <span class="badge bg-success">Open</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-danger">Closed</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <p><strong>Deadline Passed:</strong> 
                                <c:choose>
                                    <c:when test="${job.deadlinePassed}">
                                        <span class="badge bg-danger">Yes</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge bg-success">No</span>
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <h4>Applicants</h4>
                            <c:if test="${not empty job.applicants}">
                                <ul>
                                    <c:forEach var="applicantId" items="${job.applicants}">
                                        <li>Applicant ID: ${applicantId}</li>
                                    </c:forEach>
                                </ul>
                            </c:if>
                            <c:if test="${empty job.applicants}">
                                <p>No applicants yet.</p>
                            </c:if>
                        </div>
                        <div class="card-footer">
                            <a href="editJobOpening?id=${job.id}" class="btn btn-warning btn-sm">Edit</a>
                            <a href="deleteJobOpening?id=${job.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this job?');">Delete</a>
                            <a href="viewAllJobOpenings" class="btn btn-secondary btn-sm">Back to Job Openings</a>
                        </div>
                    </div>
                </c:if>
                <c:if test="${empty job}">
                    <div class="alert alert-danger text-center">
                        Job not found.
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
