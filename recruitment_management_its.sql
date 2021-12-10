--- level---
Create table level_rank(
     id  NUMBER(4) primary key NOT NULL,
     level_name nvarchar2(50) NOT NULL,
     description nvarchar2(50),
     is_delete INTEGER NOT NULL
);
insert into level_rank values (1, 'fresher', 'mới tốt nghiệp', 1);
insert into level_rank values (2, 'intern', 'mới tốt nghiệp', 0);

---- status job---
Create table job_status(
    id NUMBER(4) primary key,
    status_name nvarchar2(50) not null,
    description nvarchar2(50) not null,
    is_delete INTEGER NOT NULL
);
insert into job_status values (1, 'thông báo 1', 'ứng tuyển', 0);
insert into job_status values (2, 'thông báo 2', 'không ứng tuyển', 1);

----academic level (trình độ học vấn)----
Create table academic_level(
    id NUMBER(4) primary key,
    academic_name nvarchar2(50), --- trình độ học vấn---
    description nvarchar2(50),
    is_delete INTEGER NOT NULL
);
insert into academic_level values (1, 'đại học', 'loại giỏi', 0);
insert into academic_level values (2, 'cao học', 'loại khá', 1);

----file (hồ sơ)----
Create table profiles(
    id NUMBER(4) NOT NULL primary key,
    desire_id number(4) not null,
    user_id  NUMBER(4) NOT NULL,
    academic_level_id NUMBER(4) not null,
    skill nvarchar2(50), 
    number_years_experience NUMBER(4),  ---số năm kinh nghiệm ---
    desired_salary nvarchar2(50), --mức lương mong muốn ---
    desired_working_address nvarchar2(50), --địa chỉ làm việc mong muốn ---    
    is_delete INTEGER NOT NULL,
    CONSTRAINT fk_academic_level   FOREIGN KEY (academic_level_id)    REFERENCES academic_level (id),
    CONSTRAINT fk_user  FOREIGN KEY (user_id)  REFERENCES users (id),
    CONSTRAINT fk_desire FOREIGN KEY (desire_id)  REFERENCES desiredwork (id)

);
insert into profiles values (1, 1, 1, 1,'java, python', 1, 1000000, 'Hà Nội', 1);
insert into profiles values (2, 2, 2, 2,'java', 2, 2000000, 'Hà Nội', 0);

---- status file---
Create table profile_status(
    id NUMBER(4) NOT NULL primary key,
    name nvarchar2(50),
    description nvarchar2(50),
    is_delete INTEGER NOT NULL
);

insert into profile_status values (1, 'thông báo 1', 'ứng tuyển', 1);
insert into profile_status values (2, 'thông báo 2', 'không ứng tuyển', 0);


CREATE TABLE role(
    id NUMBER(4) NOT NULL,
    role_code VARCHAR(20) NOT NULL UNIQUE,
    description VARCHAR(50) NOT NULL,
    is_delete INTEGER NOT NULL,
    PRIMARY KEY(id)
);
insert into role values (1, '01452', 'je1', 1);
insert into role values (2, '12385', 'je2', 0);

CREATE TABLE users(
    id NUMBER(4) NOT NULL  PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE ,
    user_name VARCHAR(20) NOT NULL UNIQUE,
    password VARCHAR(20) NOT NULL,    
    phone_number  VARCHAR(20) NOT NULL UNIQUE,
    home_town VARCHAR(100) ,
    gender VARCHAR(100) ,
    birth_day DATE NOT NULL ,
    avatar VARCHAR(100),  
    user_status INTEGER NOT NULL,
    is_delete INTEGER NOT NULL
   
);
insert into users values (1, 'huy', 'nqhuybg', 'huydz', '123456', '0981995366', 'bg', 'nam', '20-JUN-2000', 'xx', 1, 1);
insert into users values (2, 'hoang', 'nqhoangbg', 'hoangdz', '123456', '0981995316', 'bg', 'nam', '20-JUN-2000', 'xx', 1, 1);

CREATE TABLE jobs_register ( 
    id NUMBER PRIMARY KEY NOT NULL,
    user_id NUMBER NOT NULL,
    profile_status_id number not null,
    job_id NUMBER NOT NULL,
    vacancies VARCHAR(50) not null,
    application_time DATE NOT NULL ,
    status VARCHAR(50) NOT NULL,
    cv_file VARCHAR(50) ,
    is_delete NUMBER NOT NULL,
    constraint fk_reg_status FOREIGN KEY(profile_status_id)REFERENCES profile_status(id),
    constraint fk_reg_user FOREIGN KEY(user_id)REFERENCES users(id),
    constraint fk_reg_jobs FOREIGN KEY(job_id)REFERENCES jobs(id)
);
insert into jobs_register values (1, 1, 1, 1, '20-JUN-2000', '22-JUN-2000', 'ngon', 'cv', 1);
insert into jobs_register values (2, 2, 2, 1, '20-JUN-2000', '22-JUN-2000', 'ngon', 'cv', 1);

CREATE TABLE jobs(
    id NUMBER PRIMARY KEY NOT NULL,
    job_status_id NUMBER(4,2) NOT NULL,
    method_work_id  NUMBER NOT NULL,
    academic_level_id NUMBER(4) NOT NULL,
    level_rank_id NUMBER(4) NOT NULL,
    createx`_id  NUMBER(4,2) NOT NULL,  
    contact_id NUMBER(4,2) NOT NULL,
    job_name VARCHAR(100) NOT NULL,
    job_position VARCHAR(100) NOT NULL,
    number_experience NUMBER NOT NULL,
    address_work VARCHAR(100) NOT NULL,
    quantity_person INTEGER NOT NULL,
    create_date DATE NOT NULL,
    due_date DATE NOT NULL,
    skills VARCHAR(100) NOT NULL,
    description VARCHAR(100) NOT NULL,
    interrest VARCHAR(100) NOT NULL,
    min_salary NUMBER NOT NULL,
    max_salary NUMBER NOT NULL,
    views  NUMBER(8,2) ,
    is_delete INTEGER NOT NULL,
    CONSTRAINT fk_method_work_j FOREIGN KEY (method_work_id)  REFERENCES method_work (id),
    CONSTRAINT fk_academic_level_j FOREIGN KEY (academic_level_id)  REFERENCES academic_level (id),
    CONSTRAINT fk_level_j FOREIGN KEY (level_rank_id)  REFERENCES level_rank (id),
    CONSTRAINT fk_contact_j FOREIGN KEY (contact_id)  REFERENCES users (id),
    CONSTRAINT fk_job_status_j FOREIGN KEY (job_status_id)  REFERENCES job_status (id),
    CONSTRAINT fk_create_j FOREIGN KEY (create_id)  REFERENCES users (id)
);
insert into jobs values (1, 1, 1, 1, 1, 1, 1, 'java', 'dev', 1, 'Hà Nội', 4, '20-JUL-2000', '22-JUL-2000', 'java,sql', 'dễ', 'java', 1000000, 2000000, 20, 1);
insert into jobs values (2, 2, 2, 2, 2, 2, 2, 'python', 'tester', 1, 'Hà Nội', 5, '21-JUL-2000', '23-JUL-2000', 'java,sql', 'dễ', 'java', 2000000, 2010000, 200, 0);

CREATE TABLE method_work(
    id NUMBER PRIMARY KEY NOT NULL,
    method_name  VARCHAR(50) NOT NULL,
    description  VARCHAR(100) NOT NULL,
    is_delete INTEGER NOT NULL
);
insert into method_work values (1, 1, 'online', 'ứng tuyển online', 1);
insert into method_work values (2, 2, 'offline', 'ứng tuyển offline', 1);


CREATE TABLE OTP(
    id NUMBER NOT NULL,
    code  NUMBER NOT NULL,
    issueAt NUMBER NOT NULL,
    create_date DATE NOT NULL, 
    user_id NUMBER NOT NULL,
    PRIMARY KEY(id ),
    CONSTRAINT fk_users FOREIGN KEY (user_id)  REFERENCES users (id)
   
);
insert into OTP values (1, 12354, 1, '20-JUN-2000', 1);
insert into OTP values (2, 12224, 0, '21-JUN-2000', 2);

CREATE TABLE notifications(
    id NUMBER NOT NULL,
    sender_id  NUMBER NOT NULL,
    receiver_id  NUMBER NOT NULL,
    create_date DATE NOT NULL, 
    content  varchar(200) NOT NULL,
    res_id NUMBER NOT NULL,
    types_id NUMBER NOT NULL,
    is_delete INTEGER NOT NULL, 
    PRIMARY KEY(id )   ,
    CONSTRAINT fk_type FOREIGN KEY (types_id)  REFERENCES types (id),
    CONSTRAINT fk_sender FOREIGN KEY (sender_id)  REFERENCES users(id),
    CONSTRAINT fk_receiver_id FOREIGN KEY (receiver_id)  REFERENCES users(id)
);
insert into notifications values (1, 1, 1, '20-JUN-2000', 'Thông báo trúng tuyển', 1, 1, 0);
insert into notifications values (2, 2, 2, '22-JUN-2000', 'Thông báo trượt', 2, 2, 1);

CREATE TABLE types(
    id NUMBER PRIMARY KEY NOT NULL,
    name  varchar(50) NOT NULL,
    description  varchar(100) NOT NULL,
    is_delete INTEGER NOT NULL 
);
insert into types values (1,'Loại 1', 'Thông báo 1', 1);
insert into types values (2,'Loại 2', 'Thông báo 2', 0);

CREATE TABLE company(
    id NUMBER NOT NULL,
    name  VARCHAR(200) NOT NULL,
    email VARCHAR(100) NOT NULL,
    hot_line VARCHAR(100) NOT NULL,
    date_incoporation DATE NOT NULL, -- ngày thành lập công ty
    tax_code VARCHAR(100) NOT NULL,
    tax_date DATE NOT NULL,-- Ngày cấp mã số thuế
    tax_place VARCHAR(50) NOT NULL, -- Nơi cấp mã số thuế
    head_office VARCHAR(50) NOT NULL, -- trụ sở chính
    number_staff INTEGER NOT NULL, -- số lượng nhân viên
    link_web VARCHAR(50) NOT NULL, -- trụ sở chính
    description VARCHAR(50) NOT NULL, -- mô tả công ty
    avatar VARCHAR(50) NOT NULL, -- ảnh đại diện
    backdrop_img VARCHAR(50) NOT NULL, -- ảnh bìa
    is_delete INTEGER NOT NULL,
    PRIMARY KEY(id )
);
INSERT INTO company VALUES(1,N'Công ty itsol','itsol@itsol.com','0909999988','01-jun-2010','1000','01-jun-2010','Ha Noi','Duy Tan',500,'Itsol.com','Cong ty cong nghe','avatar','anh bia',0);

Create table desired_work(
    id NUMBER(4) primary key,
    desired_work_name nvarchar2(50),
    description  VARCHAR(100) NOT NULL,
    is_delete INTEGER NOT NULL
);
insert into desiredwork values (1,'full time', 'toàn thời gian', 1);
insert into desiredwork values (2,'part time', 'bán thời gian', 0);

