<%@page import="com.klef.jfsd.springboot.model.Admin"%>
<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<%
Admin currentAdmin = (Admin) session.getAttribute("admin");

if (currentAdmin == null) {
    response.sendRedirect("adminLogin");
}
%>

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
<%@ include file="employer-header.jsp" %>

<body>
<section id="main-content">
    <section class="wrapper">
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">${errorMessage}</div>
        </c:if>
        
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-building"></i> Edit Employer Profile
                    </header>
                    <div class="card-body">
                        <form action="adminupdateEmployerProfile" method="post">
                            <input type="hidden" name="id" value="${employer.id}" />

                            <div class="form-group">
                                <label for="companyName">Company Name</label>
                                <input type="text" class="form-control" id="companyName" name="companyName" 
                                       value="${employer.companyName}" required />
                            </div>
                            <div class="form-group">
                                <label for="contactPerson">Contact Person</label>
                                <input type="text" class="form-control" id="contactPerson" name="contactPerson" 
                                       value="${employer.contactPerson}" required />
                            </div>
                            <div class="form-group">
                                <label for="contactEmail">Contact Email</label>
                                <input type="email" class="form-control" id="contactEmail" name="contactEmail" 
                                       value="${employer.contactEmail}" required />
                            </div>
                            <div class="form-group">
                                <label for="contactPhone">Contact Phone</label>
                                <input type="text" class="form-control" id="contactPhone" name="contactPhone" 
                                       value="${employer.contactPhone}" />
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea class="form-control" id="address" name="address">${employer.address}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="website">Website</label>
                                <input type="url" class="form-control" id="website" name="website" 
                                       value="${employer.website}" />
                            </div>
                            <div class="form-group">
                                <label for="industryType">Industry Type</label>
                                <input type="text" class="form-control" id="industryType" name="industryType" 
                                       value="${employer.industryType}" />
                            </div>
                            <div class="form-group">
                                <label for="password">Password (Optional)</label>
                                <input type="password" class="form-control" id="password" name="password" />
                            </div>
                            <div class="form-group">
                                <label for="verified">Verified</label>
                                <select class="form-control" id="verified" name="verified">
                                    <option value="true" ${employer.verified ? 'selected' : ''}>Yes</option>
                                    <option value="false" ${!employer.verified ? 'selected' : ''}>No</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>




<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/common-scripts.js"></script>
</body>
</html>
