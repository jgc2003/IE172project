CREATE TABLE clients(
  client_id serial primary key not null,
  client_first_m varchar(32) not null,
  client_last_m varchar(32) not null,
  client_company varchar(128) not null,
  client_email varchar(128) not null,
  date_acquired date not null,
  client_status varchar(32),
  client_delete_ind boolean default false
);

CREATE TABLE va(
  va_id serial primary key not null,
  va_first_m varchar(32) not null,
  va_last_m varchar(32) not null,
  va_email varchar(64) not null,
  va_address varchar(128) not null,
  date_hired date not null,
  va_status varchar(32),
  va_delete_ind boolean default false
);

CREATE TABLE skills(
  skill_id serial primary key not null,
  skill_m varchar(64) not null,
  skill_description varchar(128) not null,
  skill_delete_ind boolean default false
);

CREATE TABLE jobs(
  job_id serial primary key not null,
  job_title varchar(64) not null,
  days int not null,
  hours int not null,
  hourly_rate numeric(5,2) not null,
  hourly_commission numeric(5,2) not null,
  start_date date not null,
  assignment_date date not null,
  job_status varchar(32) not null,
  client_id int references clients(client_id),
  va_id int references va(va_id),
  job_delete_ind boolean default false
);

CREATE TABLE jobs_skills(
  job_skill_id serial primary key not null,
  skill_id int references skills(skill_id),
  job_id int references jobs(job_id)
);

CREATE TABLE va_skills(
  va_skill_id serial primary key not null,
  va_id int references va(va_id),
  skill_id int references skill(skill_id)
);

CREATE TABLE users(
  user_name varchar(32) unique,
  user_password varchar(64) not null,
  user_modified_on timestamp without time zone default now(),
  user_delete_ind boolean default false
);

