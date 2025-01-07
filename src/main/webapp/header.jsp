<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>

<body class="light-sidebar-nav">
    <section id="container">
        <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <i class="fa fa-bars"></i>
            </div>
            <a href="/" class="logo">Home Page</a>
        </header>
        <aside>
            <div id="sidebar" class="nav-collapse">
                <ul class="sidebar-menu" id="nav-accordion">
                    <li>
                        <a href="studentLogin">
                            <i class="fa fa-user"></i>
                            <span>Student Login</span>
                        </a>
                    </li>
                    <li>
                        <a href="adminLogin">
                            <i class="fa fa-user-circle"></i>
                            <span>Admin Login</span>
                        </a>
                    </li>
                    <li>
                        <a href="employerLogin">
                            <i class="fa fa-building"></i>
                            <span>Employer Login</span>
                        </a>
                    </li>
                    <li>
                        <a href="about.jsp">
                            <i class="fa fa-info-circle"></i>
                            <span>About Us</span>
                        </a>
                    </li>
                    <li>
                        <a href="contactus.jsp">
                            <i class="fa fa-envelope"></i>
                            <span>Contact Us</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
    </section>
</body>
</html>
