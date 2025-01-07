<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<%@ include file="admin-header.jsp" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student Profile</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <section id="main-content">
        <section class="wrapper">
            <div class="container" style="margin-top: 50px;">
                <h2 class="text-center mb-5">Edit Student Profile</h2>

                <c:if test="${not empty student}">
                    <form action="/editStudentProfile" method="post">
                        <input type="hidden" name="id" value="${student.id}" />
                        <div class="mb-3">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" value="${student.name}" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" value="${student.email}" required>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${student.phoneNumber}" required>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="${student.address}" required>
                        </div>
                        <div class="mb-3">
                            <label for="dateOfBirth" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${student.dateOfBirth}" required>
                        </div>
                        <div class="mb-3">
                            <label for="gender" class="form-label">Gender</label>
                            <select class="form-control" id="gender" name="gender" required>
                                <option value="Male" <c:if test="${student.gender == 'Male'}">selected</c:if>>Male</option>
                                <option value="Female" <c:if test="${student.gender == 'Female'}">selected</c:if>>Female</option>
                                <option value="Other" <c:if test="${student.gender == 'Other'}">selected</c:if>>Other</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="department" class="form-label">Department</label>
                            <input type="text" class="form-control" id="department" name="department" value="${student.department}" required>
                        </div>
                        <div class="mb-3">
                            <label for="yearOfStudy" class="form-label">Year of Study</label>
                            <input type="number" class="form-control" id="yearOfStudy" name="yearOfStudy" value="${student.yearOfStudy}" required>
                        </div>
                        <div class="mb-3">
                            <label for="cgpa" class="form-label">CGPA</label>
                            <input type="number" class="form-control" id="cgpa" name="cgpa" step="0.01" value="${student.cgpa}" required>
                        </div>

                        <!-- Add additional fields as necessary for skills, companies, etc. -->

                        <button type="submit" class="btn btn-primary">Update Profile</button>
                    </form>
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
