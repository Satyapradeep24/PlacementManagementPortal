<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body class="light-sidebar-nav">
    <section id="container">
        <!-- Header -->
        <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <i class="fa fa-bars"></i>
            </div>
            <a href="adminDashboard" class="logo">Admin<span>Dashboard</span></a>
            <div class="top-nav">
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder="Search">
                    </li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="" src="img/avatar1_small.jpg">
                            <span class="username">Admin</span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout dropdown-menu-right">
                            <li><a href="adminProfile"><i class="fa fa-suitcase"></i>Profile</a></li>
                            <li><a href="#"><i class="fa fa-cog"></i> Settings</a></li>
                            <li><a href="/"><i class="fa fa-key"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>

        <!-- Sidebar -->
        <aside>
            <div id="sidebar" class="nav-collapse">
                <ul class="sidebar-menu" id="nav-accordion">
                    <li>
                        <a class="active" href="index.html">
                            <i class="fa fa-dashboard"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sub-menu">
                        <a href="javascript:;">
                            <i class="fa fa-users"></i>
                            <span>Manage Users</span>
                        </a>
                        <ul class="sub">
                            <li><a href="adminViewAllStudents">Students</a></li>
                            <li><a href="viewAllEmployers">Employers</a></li>
                            <li><a href="admins.html">Admins</a></li>
                        </ul>
                    </li>
                     <li>
                        <a class="active" href="viewAllEmployers">
                            <i class="fa fa-dashboard"></i>
                            <span>Employers</span>
                        </a>
                    </li>
                    <li>
                        <a class="" href="viewAllJobOpenings">
                            <i class="fa fa-dashboard"></i>
                            <span>Job Openings</span>
                        </a>
                    </li>
                    
                    <!-- <li class="sub-menu">
                        <a href="javascript:;">
                            <i class="fa fa-briefcase"></i>
                            <span>Job Openings</span>
                        </a>
                        <ul class="sub">
                            <li><a href="view_jobs.html">View Jobs</a></li>
                            <li><a href="add_job.html">Add Job</a></li>
                        </ul>
                    </li> -->
                    <li>
                        <a href="reports.html">
                            <i class="fa fa-bar-chart-o"></i>
                            <span>Reports</span>
                        </a>
                    </li>
                    <li>
                        <a href="settings.html">
                            <i class="fa fa-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li>
                    <li>
                        <a href="/">
                            <i class="fa fa-sign-out"></i>
                            <span>Log Out</span>
                        </a>
                    </li>
                </ul>
            </div>
        </aside>
