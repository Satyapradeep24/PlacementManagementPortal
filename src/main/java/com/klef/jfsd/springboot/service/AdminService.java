package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;

public interface AdminService {
	public Admin authenticateAdmin(String email, String password);
	public Admin findAdminById(long id);
	public void updateAdmin(Admin admin);
	public List<Student> viewAllStudents();
	public List<Employer> viewAllEmployer();
	public Student getStudentById(Long id) ;
	public Student updateStudent(Student student) ;
	Employer getEmployerById(Long id);
	Employer updateEmployerProfile(Employer updatedEmployer);
	public void deleteEmployerById(Long id);
	
	public List<JobNotification> getAllJobOpenings();
	
	public Optional<JobNotification> getJobById(Long jobId) ;
    public void deleteJobById(Long jobId) ;
    public JobNotification saveOrUpdateJob(JobNotification jobNotification) ;
	
}
