package com.infosys.onlinedoctorappointment;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class OnlineDoctorAppointmentOAuthServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(OnlineDoctorAppointmentOAuthServerApplication.class, args);
	}

}
