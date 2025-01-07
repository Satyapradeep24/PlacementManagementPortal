package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.EmployerRepository;
import com.klef.jfsd.springboot.repository.JobNotificationRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminRepository adminRepository;
	
	@Autowired
	StudentRepository studentRepository;
	
	@Autowired
	EmployerRepository employerRepository;
	
	@Autowired
	JobNotificationRepository jobNotificationRepository;
	
	public Admin authenticateAdmin(String email, String password) {
        Admin admin = adminRepository.findAdmin(email, password);
        return admin;
    }

	@Override
	public Admin findAdminById(long id) {
		return adminRepository.findById(id).get();
	}
	public void updateAdmin(Admin admin) {
        adminRepository.save(admin); // Save the updated admin entity
    }

	@Override
	public List<Student> viewAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public List<Employer> viewAllEmployer() {
		return employerRepository.findAll();
	}
	public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);  // Returns null if student not found
    }
	public Student updateStudent(Student student) {
        if (student.getId() != null && studentRepository.existsById(student.getId())) {
            return studentRepository.save(student);  // Save the updated student object
        }
        return null;  // Return null if student not found
    }
	@Override
    public Employer getEmployerById(Long id) {
        return employerRepository.findById(id).orElse(null);
    }
	@Override
    public Employer updateEmployerProfile(Employer updatedEmployer) {
        Employer existingEmployer = employerRepository.findById(updatedEmployer.getId())
                .orElseThrow(() -> new RuntimeException("Employer not found"));

        existingEmployer.setCompanyName(updatedEmployer.getCompanyName());
        existingEmployer.setContactPerson(updatedEmployer.getContactPerson());
        existingEmployer.setContactEmail(updatedEmployer.getContactEmail());
        existingEmployer.setContactPhone(updatedEmployer.getContactPhone());
        existingEmployer.setAddress(updatedEmployer.getAddress());
        existingEmployer.setWebsite(updatedEmployer.getWebsite());
        existingEmployer.setIndustryType(updatedEmployer.getIndustryType());

        if (updatedEmployer.getPassword() != null && !updatedEmployer.getPassword().isEmpty()) {
            existingEmployer.setPassword(updatedEmployer.getPassword());
        }

        existingEmployer.setVerified(updatedEmployer.isVerified());

        return employerRepository.save(existingEmployer);
    }
	public void deleteEmployerById(Long id) {
        if (employerRepository.existsById(id)) {
            employerRepository.deleteById(id);
        } else {
            throw new IllegalArgumentException("Employer with ID " + id + " does not exist.");
        }
    }
	
	public List<JobNotification> getAllJobOpenings() {
        return jobNotificationRepository.findAll();
    }
	
	public Optional<JobNotification> getJobById(Long jobId) {
        return jobNotificationRepository.findById(jobId);
    }

    // Delete a job notification by ID
    public void deleteJobById(Long jobId) {
        jobNotificationRepository.deleteById(jobId);
    }

    // Save or update a job notification
    public JobNotification saveOrUpdateJob(JobNotification jobNotification) {
        return jobNotificationRepository.save(jobNotification);
    }

}
