<%@ include file="header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="container" style="margin-top: 50px;">
            <h2 class="text-center mb-5">Where Talent Meets Opportunity</h2>
            <p class="text-center">
                Superset helps fresh graduates get their first jobs, enables employers to recruit faster, 
                and helps colleges streamline campus placements.
            </p>

            <!-- Animated Stats Section -->
            <div class="row text-center mt-4">
                <div class="col-lg-4">
                    <div class="stat-card">
                        <h3><strong class="count-up" data-count="2700000">0</strong>+</h3>
                        <p>Students and Young Alumni</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="stat-card">
                        <h3><strong class="count-up" data-count="600">0</strong>+</h3>
                        <p>College Placement Cells</p>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="stat-card">
                        <h3><strong class="count-up" data-count="12800">0</strong>+</h3>
                        <p>Employers</p>
                    </div>
                </div>
            </div>

            <!-- About & Contact Cards with Hover Effects -->
            <div class="row mt-5">
                <div class="col-lg-6">
                    <section class="card hover-card">
                        <div class="card-body text-center">
                            <h3>About Us</h3>
                            <p>We are a platform connecting students with employers for job opportunities.</p>
                            <a href="about.jsp" class="btn btn-info">Learn More</a>
                        </div>
                    </section>
                </div>
                <div class="col-lg-6">
                    <section class="card hover-card">
                        <div class="card-body text-center">
                            <h3>Contact Us</h3>
                            <p>Have any questions? Get in touch with us for support and inquiries.</p>
                            <a href="contactus.jsp" class="btn btn-info">Contact Us</a>
                        </div>
                    </section>
                </div>
            </div>

            <!-- Login Sections with Icon Animations -->
            <div class="row mt-5">
                <div class="col-lg-4">
                    <section class="card login-card">
                        <div class="card-body text-center">
                            <i class="fa fa-laptop animated-icon"></i>
                            <h3>Employers</h3>
                            <p>End-to-end virtual campus hiring with complete automation, from outreach to analytics.</p>
                            <a href="employerLogin" class="btn btn-primary">Login</a>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="card login-card">
                        <div class="card-body text-center">
                            <i class="fa fa-university animated-icon"></i>
                            <h3>Universities</h3>
                            <p>Digitize & automate placements online for a streamlined, efficient process.</p>
                            <a href="adminLogin" class="btn btn-primary">Login</a>
                        </div>
                    </section>
                </div>
                <div class="col-lg-4">
                    <section class="card login-card">
                        <div class="card-body text-center">
                            <i class="fa fa-graduation-cap animated-icon"></i>
                            <h3>Students</h3>
                            <p>Discover new opportunities, prepare for interviews, and apply for jobs effortlessly.</p>
                            <a href="studentLogin" class="btn btn-primary">Login</a>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </section>
</section>

<%@ include file="footer.jsp" %>

<script>
    // JavaScript for Count-Up Animation
    document.addEventListener("DOMContentLoaded", function () {
        const counters = document.querySelectorAll('.count-up');
        counters.forEach(counter => {
            const updateCount = () => {
                const target = +counter.getAttribute('data-count');
                const count = +counter.innerText;
                const speed = 200; // Lower is faster
                const increment = target / speed;

                if (count < target) {
                    counter.innerText = Math.ceil(count + increment);
                    setTimeout(updateCount, 10);
                } else {
                    counter.innerText = target;
                }
            };
            updateCount();
        });
    });

    // Icon Hover Animation
    const icons = document.querySelectorAll('.animated-icon');
    icons.forEach(icon => {
        icon.addEventListener('mouseover', () => icon.classList.add('fa-bounce'));
        icon.addEventListener('mouseout', () => icon.classList.remove('fa-bounce'));
    });
</script>

<style>
    /* Interactive Styling */
    .stat-card h3 {
        font-size: 2rem;
        color: #007bff;
    }

    .hover-card:hover {
        background-color: #f9f9f9;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        transform: scale(1.05);
        transition: all 0.3s ease-in-out;
    }

    .animated-icon {
        font-size: 50px;
        color: #007bff;
        transition: transform 0.3s ease-in-out;
    }

    .animated-icon.fa-bounce {
        animation: bounce 0.5s infinite;
    }

    @keyframes bounce {
        0%, 100% {
            transform: translateY(0);
        }
        50% {
            transform: translateY(-10px);
        }
    }

    .login-card:hover .animated-icon {
        transform: scale(1.2);
    }

    .login-card:hover .btn {
        background-color: #0056b3;
    }
</style>
