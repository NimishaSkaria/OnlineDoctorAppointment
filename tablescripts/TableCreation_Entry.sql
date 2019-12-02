create table if not exists onlinedoctorappointment.oauth_access_token (
  token_id VARCHAR(255),
  token LONG VARBINARY,
  authentication_id VARCHAR(255) PRIMARY KEY,
  user_name VARCHAR(255),
  client_id VARCHAR(255),
  authentication LONG VARBINARY,
  refresh_token VARCHAR(255)
);
create table if not exists onlinedoctorappointment.oauth_refresh_token (
  token_id VARCHAR(255),
  token LONG VARBINARY,
  authentication LONG VARBINARY
);



CREATE TABLE `onlinedoctorappointment`.`patient` (
  `patient_id` INT NOT NULL,
  `patient_name` VARCHAR(45) NOT NULL,
  `age` INT NULL,
  `address` VARCHAR(45) NULL,
  PRIMARY KEY (`patient_id`));
  
  ALTER TABLE `onlinedoctorappointment`.`patient` 
ADD COLUMN `password` VARCHAR(150) NOT NULL AFTER `patient_name`;

ALTER TABLE `onlinedoctorappointment`.`patient` 
CHANGE COLUMN `patient_id` `patient_id` INT(11) NOT NULL AUTO_INCREMENT ;

  
  CREATE TABLE `onlinedoctorappointment`.`consultation_department` (
  `department_id` INT NOT NULL,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`));
  
  CREATE TABLE `onlinedoctorappointment`.`doctor` (
  `doctor_id` INT NOT NULL,
  `doctor_name` VARCHAR(100) NOT NULL,
  `department_id` INT NOT NULL,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`doctor_id`),
  INDEX `FK_Department_idx` (`department_id` ASC),
  CONSTRAINT `FK_Department`
    FOREIGN KEY (`department_id`)
    REFERENCES `onlinedoctorappointment`.`consultation_department` (`department_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	
   ALTER TABLE `onlinedoctorappointment`.`doctor` 
CHANGE COLUMN `doctor_id` `doctor_id` INT(11) NOT NULL AUTO_INCREMENT ;
	
  CREATE TABLE `onlinedoctorappointment`.`appointment_history` (
  `appointment_id` INT NOT NULL,
  `patient_id` INT NOT NULL,
  `doctor_id` INT NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `appointment_on` DATE NULL,
  PRIMARY KEY (`appointment_id`),
  INDEX `FK_Patient_idx` (`patient_id` ASC),
  INDEX `FK_Doctor_idx` (`doctor_id` ASC),
  CONSTRAINT `FK_Patient`
    FOREIGN KEY (`patient_id`)
    REFERENCES `onlinedoctorappointment`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Doctor`
    FOREIGN KEY (`doctor_id`)
    REFERENCES `onlinedoctorappointment`.`doctor` (`doctor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	ALTER TABLE `onlinedoctorappointment`.`appointment_history` 
CHANGE COLUMN `appointment_id` `appointment_id` INT(11) NOT NULL AUTO_INCREMENT ;

