<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job Opening</title>
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
                <h2 class="text-center mb-5">Edit Job Opening</h2>

                <c:if test="${not empty job}">
                    <form action="updateJobOpening" method="post">
                        <input type="hidden" name="id" value="${job.id}" />

                        <div class="mb-3">
                            <label for="jobTitle" class="form-label">Job Title</label>
                            <input type="text" class="form-control" id="jobTitle" name="jobTitle" value="${job.jobTitle}" required>
                        </div>

                        <div class="mb-3">
                            <label for="jobDescription" class="form-label">Job Description</label>
                            <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" required>${job.jobDescription}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="jobType" class="form-label">Job Type</label>
                            <select class="form-select" id="jobType" name="jobType" required>
                                <option value="Full-Time" ${job.jobType == 'Full-Time' ? 'selected' : ''}>Full-Time</option>
                                <option value="Part-Time" ${job.jobType == 'Part-Time' ? 'selected' : ''}>Part-Time</option>
                                <option value="Contract" ${job.jobType == 'Contract' ? 'selected' : ''}>Contract</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="location" class="form-label">Location</label>
                            <input type="text" class="form-control" id="location" name="location" value="${job.location}" required>
                        </div>

                        <div class="mb-3">
                            <label for="company" class="form-label">Company</label>
                            <input type="text" class="form-control" id="company" name="company" value="${job.company}" required>
                        </div>

                        <div class="mb-3">
                            <label for="contactEmail" class="form-label">Contact Email</label>
                            <input type="email" class="form-control" id="contactEmail" name="contactEmail" value="${job.contactEmail}" required>
                        </div>

                        <div class="mb-3">
                            <label for="qualifications" class="form-label">Qualifications</label>
                            <textarea class="form-control" id="qualifications" name="qualifications" rows="3">${job.qualifications}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="skillsRequired" class="form-label">Skills Required</label>
                            <textarea class="form-control" id="skillsRequired" name="skillsRequired" rows="3">${job.skillsRequired}</textarea>
                        </div>

                        <div class="mb-3">
                            <label for="deadline" class="form-label">Application Deadline</label>
                            <input type="date" class="form-control" id="deadline" name="deadline" value="${job.deadline}" required>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update Job</button>
                            <a href="viewAllJobOpenings" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </c:if>

                <c:if test="${empty job}">
                    <div class="alert alert-danger text-center">
                        Job not found!
                    </div>
                </c:if>
            </div>
        </section>
    </section>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>

</html>
