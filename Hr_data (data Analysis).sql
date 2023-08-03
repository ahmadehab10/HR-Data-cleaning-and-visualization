-- Questions
 -- 1- What is the gender breakdown of employees in the company?
 Select gender,count(gender) numberOfEmployees
 from hr_data
 where gender is not null
 group by gender;
 -- 2- what is the race breakdown of employees in the company?
 Select race,count(race) as NumberOfEmployees
 from hr_data
 where race is not null
 group by race
 order by count(race) desc;
 
/* 3- What is the age distribution of the employees in the company*/
select min(age) as Youngest,
Max(age) as Oldest
From hr_data;

Select 
case 
When age >= 20 and age <=30 then '20-30'
When age >= 31 and age <=40 then '31-40'
When age >= 41 and age <=50 then '41-50'
Else'51-60'
End as age_group, gender,
count(distinct emp_id) as count 
from hr_data
Group by age_group,gender
order by age_group,gender ASC;

/*4-How Many Employees work at headquarters vs remote locations?*/
Select location,Count(distinct emp_id) NumberOfEmplpyees
from hr_data 
where location is not null
group by location;

/*5-how does gender distribution vary across departments and job titles?*/
Select department,gender,Count(distinct emp_id) as NumberOfEmployees
from hr_data
where department is not null
Group by department,Gender
order by department;

Select Jobtitle,gender,Count(distinct emp_id) as NumberOfEmployees
from hr_data
where Jobtitle is not null
Group by Jobtitle,Gender
order by Jobtitle;

/*6-What is the distribution of job titles across the company?*/
Select jobtitle,count(distinct emp_id) as NumberOfEmployees
from hr_data
where jobtitle is not null
group by jobtitle
order by NumberOfEmployees DESC;

/*7- What is the distribution of employees across locations by city and state*/
select location_city, Count(distinct emp_id) as Count
from hr_data
group by location_city
order by count(distinct emp_id) desc;

