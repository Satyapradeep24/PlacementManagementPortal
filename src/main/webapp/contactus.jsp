<%@ include file="header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="container" style="margin-top: 50px;">
            <h2 class="text-center mb-5">Contact Us</h2>
            <div class="row">
                <div class="col-lg-6">
                    <h3>Get in Touch</h3>
                    <p>If you have any questions, feedback, or need support, feel free to reach out to us using the form below. 
                    Our team is here to assist you!</p>
                    <ul class="list-unstyled">
                        <li><i class="fa fa-map-marker" style="font-size: 20px;"></i> Address: 123 Campus Lane, KL UNIVERSITY</li>
                        <li><i class="fa fa-phone" style="font-size: 20px;"></i> Phone: + 88888888888</li>
                        <li><i class="fa fa-envelope" style="font-size: 20px;"></i> Email: support@superset.com</li>
                    </ul>
                </div>
                <div class="col-lg-6">
                    <form action="submitContactForm" method="post">
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="message">Message:</label>
                            <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>

<%@ include file="footer.jsp" %>
