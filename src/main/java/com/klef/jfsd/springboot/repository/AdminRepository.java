package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Student;


@Repository
public interface AdminRepository extends JpaRepository<Admin, Long>{
	
	@Query("SELECT s FROM Admin s WHERE s.email = :email AND s.password = :password")
	Admin findAdmin(@Param("email") String email, @Param("password") String password);
}	
