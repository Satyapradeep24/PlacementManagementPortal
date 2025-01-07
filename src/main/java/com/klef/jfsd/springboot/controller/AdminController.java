package com.klef.jfsd.springboot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/")
	public  String home() {
		return "index";
	}
	@GetMapping("/adminLogin")
	public String login() {
		return "admin-login";
	}
	@GetMapping("adminDashboard")
	public String adminDashboard() {
		return "admin-dashboard";
	}
	
	@PostMapping("/adminLogin")
    public String login(@RequestParam("email") String email,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {
        Admin isAuthenticated = adminService.authenticateAdmin(email, password);
        

        if (isAuthenticated!=null) {
        	System.out.println(isAuthenticated.toString());
            session.setAttribute("admin", isAuthenticated); // Save admin email in session
            return "redirect:/adminDashboard"; // Redirect to admin dashboard
        } else {
        	System.out.println("admin not found");
            model.addAttribute("errorMessage", "Invalid email or password. Please try again.");
            return "redirect:/adminLogin"; // Redirect back to login page
        }
    }
	
	@GetMapping("adminProfile")
	public String updateAdmin(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		Admin admin=(Admin) session.getAttribute("admin");
		model.addAttribute("admin", admin);
		return "admin-profile";
		
	}
	@PostMapping("/updateAdminProfile")
    public String updateAdminProfile(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Admin currentAdmin = (Admin) session.getAttribute("admin");

        if (currentAdmin == null) {
            return "redirect:/adminLogin";
        }

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactPhone = request.getParameter("contactPhone");
        String password = request.getParameter("password");

        currentAdmin.setName(name);
        currentAdmin.setEmail(email);
        currentAdmin.setContactPhone(contactPhone);

        if (password != null && !password.trim().isEmpty()) {
            currentAdmin.setPassword(password);
        }

        adminService.updateAdmin(currentAdmin);

        session.setAttribute("admin", currentAdmin);

        model.addAttribute("successMessage", "Profile updated successfully!");
        return "redirect:/adminProfile";
    }
	
	@GetMapping("/adminViewAllStudents")
    public String viewAllStudents(Model model) {
        List<Student> students = adminService.viewAllStudents();
        model.addAttribute("students", students);
        return "admin-viewAllStudents"; 
    }
	
	@GetMapping("/viewStudentProfile")
    public String viewStudentProfile(@RequestParam("id") Long id, Model model) {
        Student student = adminService.getStudentById(id);
        if (student != null) {
            model.addAttribute("student", student);
            return "admin-viewStudentProfile";  // JSP page to display the student's profile
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";  // Return an error page if student is not found
        }
    }
	@GetMapping("/editStudentProfile")
    public String showEditStudentProfile(@RequestParam("id") Long id, Model model) {
        Student student = adminService.getStudentById(id);
        if (student != null) {
            model.addAttribute("student", student);
            return "admin-editStudentProfile";  // JSP page to display the edit form
        } else {
            model.addAttribute("errorMessage", "Student not found");
            return "error";  // Return an error page if student not found
        }
    }

    // Update the student profile
    @PostMapping("/editStudentProfile")
    public String updateStudentProfile(Student student, Model model) {
        Student updatedStudent = adminService.updateStudent(student);
        if (updatedStudent != null) {
            model.addAttribute("student", updatedStudent);
            return "redirect:/viewStudentProfile?id=" + updatedStudent.getId();  // Redirect to the student's profile page
        } else {
            model.addAttribute("errorMessage", "Error updating student profile");
            return "error";  // Return an error page
        }
    }
    @GetMapping("/viewAllEmployers")
    public String viewAllEmployers(Model model) {
        model.addAttribute("employers", adminService.viewAllEmployer());
        return "admin-viewAllEmployers"; // JSP page to display all employers
    }
    @GetMapping("/viewEmployerProfile")
    public String viewEmployerProfile(@RequestParam("id") Long id, Model model) {
        Employer employer = adminService.getEmployerById(id);
        if (employer != null) {
            model.addAttribute("employer", employer);
        }
        return "admin-viewEmployerProfile";
    }
    
    @GetMapping("/editEmployerProfile")
    public String showEditEmployerProfile(@RequestParam("id") Long id, Model model) {
        Employer employer = adminService.getEmployerById(id);

        if (employer == null) {
            model.addAttribute("errorMessage", "Employer not found.");
            return "error"; // Redirect to an error page if the employer doesn't exist
        }

        model.addAttribute("employer", employer);
        return "admin-editEmployerProfile"; // JSP page for editing employer profile
    }
    @PostMapping("/adminupdateEmployerProfile")
    public String updateEmployerProfile(Employer updatedEmployer, Model model) {
        try {
            Employer employer = adminService.updateEmployerProfile(updatedEmployer);
            model.addAttribute("successMessage", "Profile updated successfully.");
            return "redirect:/viewEmployerProfile?id=" + employer.getId(); // Redirect to profile view
        } catch (Exception ex) {
            model.addAttribute("errorMessage", "Failed to update profile: " + ex.getMessage());
            return "editEmployerProfile"; // Stay on the same page if there's an error
        }
    }
    
    @GetMapping("/deleteEmployer")
    public String deleteEmployer(@RequestParam("id") Long id, Model model) {
        try {
            // Call service to delete the employer
            adminService.deleteEmployerById(id);

            // Add a success message to the model (optional)
            model.addAttribute("successMessage", "Employer deleted successfully.");

            // Redirect to the view all employers page
            return "redirect:/viewAllEmployers";
        } catch (Exception ex) {
            // Add an error message to the model
            model.addAttribute("errorMessage", "Failed to delete employer: " + ex.getMessage());

            // Redirect to the view all employers page with an error
            return "redirect:/viewAllEmployers";
        }
    }
    
    @GetMapping("/viewAllJobOpenings")
    public String viewAllJobOpenings(Model model) {
        List<JobNotification> jobNotifications = adminService.getAllJobOpenings();
        model.addAttribute("jobNotifications", jobNotifications);
        return "admin-viewAllJobOpenings"; // JSP view
    }
    
    @GetMapping("/viewJobDetails")
    public String viewJobDetails(@RequestParam("id") Long jobId, Model model) {
        Optional<JobNotification> jobOptional = adminService.getJobById(jobId);

        if (jobOptional.isPresent()) {
            model.addAttribute("job", jobOptional.get());
        } else {
            model.addAttribute("job", null);
        }

        return "admin-viewJobDetails";
    }

    // Delete a specific job
    @GetMapping("/deleteJobOpening")
    public String deleteJobOpening(@RequestParam("id") Long jobId) {
        adminService.deleteJobById(jobId);
        return "redirect:/viewAllJobOpenings";
    }

    // Edit Job Redirect (Page for Editing)
    @GetMapping("/editJobOpening")
    public String editJobOpening(@RequestParam("id") Long jobId, Model model) {
        Optional<JobNotification> jobOptional = adminService.getJobById(jobId);

        if (jobOptional.isPresent()) {
            model.addAttribute("job", jobOptional.get());
        } else {
            model.addAttribute("job", null);
        }

        return "admin-editJobOpening";
    }


}

