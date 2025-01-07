<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@page import="com.klef.jfsd.springboot.model.Internship"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<%

Student currentStudent = (Student) session.getAttribute("student");

if (currentStudent == null) {
    response.sendRedirect("studentLogin");
}
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Internships</title>
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
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-institution"></i> Available Internships
                    </header>
                    <div class="card-body">
                        <div class="mb-3">
						    <h4>Add New Internship</h4>
						    <form action="addInternship" method="POST">
						        <div class="form-group">
						            <label for="title">Internship Title</label>
						            <input type="text" id="title" name="title" class="form-control" required>
						        </div>
						        <div class="form-group">
						            <label for="role">Role</label>
						            <input type="text" id="role" name="role" class="form-control" required>
						        </div>
						        <div class="form-group">
						            <label for="company">Company</label>
						            <input type="text" id="company" name="company" class="form-control" required>
						        </div>
						        <div class="form-group">
						            <label for="duration">Duration</label>
						            <input type="text" id="duration" name="duration" class="form-control" required>
						        </div>
						        <div class="form-group">
						            <label for="skillsLearned">Skills Obtained</label>
						            <input type="text" id="skillsLearned" name="skillsLearned" class="form-control" required>
						        </div>
						        <div class="form-group">
						            <label for="description">Description</label>
						            <textarea id="description" name="internshipDescription" class="form-control" required></textarea>
						        </div>
						        <div class="form-group">
						            <label for="location">Location</label>
						            <input type="text" id="location" name="location" class="form-control" required>
						        </div>
						        <button type="submit" class="btn btn-primary">Add Internship</button>
						    </form>
						</div>
                        <table class="table table-striped mt-4">
                            <thead>
                                <tr>
                                    <th>Internship Title</th>
                                    <th>Company</th>
                                    <th>Duration</th>
                                    <th>Skills Obtained</th>
                                    <th>internshipDescription</th>
                                    <th>Location</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="internship" items="${internships}">
                                    <tr>
                                        <td><c:out value="${internship.role}" /></td>
                                        <td><c:out value="${internship.companyName}" /></td>
                                        <td><c:out value="${internship.duration}" /></td>
                                        <td><c:out value="${internship.skillsLearned}" /></td>
                                        <td><c:out value="${internship.internshipDescription}" /></td>
                                        <td><c:out value="${internship.location}" /></td>
                                         <td>
						                    <!-- Update button -->
						                    <form action="updateInternship" method="POST" style="display: inline;">
						                        <input type="hidden" name="id" value="${internship.id}">
						                        <button type="submit" class="btn btn-warning btn-sm">
						                            <i class="fa fa-edit"></i> Update
						                        </button>
						                    </form>
						                    <!-- Delete button -->
						                    <form action="deleteInternship" method="POST" style="display: inline;">
						                        <input type="hidden" name="id" value="${internship.id}">
						                        <button type="submit" class="btn btn-danger btn-sm">
						                            <i class="fa fa-trash"></i> Delete
						                        </button>
						                    </form>
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
