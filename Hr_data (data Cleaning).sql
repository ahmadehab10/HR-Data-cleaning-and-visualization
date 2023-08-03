Select * from hr_data;
/*change column name*/
alter table hr_data
change column ï»؟id emp_id varchar(20) NULL;

/*removing strict mode*/
SET SQL_MODE = ' ';

/*change date format*/
update hr_data
set birthdate = case
when birthdate like '%/%' Then date_format(str_to_date
(birthdate,'%m/%d/%y'),'%y-%m-%d')
When birthdate like '%-%' Then date_format(str_to_date
(birthdate,'%m-%d-%y'),'%y-%m-%d')
Else NULL 
End;	

/* changing data types for date fields*/
alter table hr_data
modify column birthdate date;
alter table hr_data
modify column hire_date date;

/* Creating Age Column using timestampdiff*/
alter table hr_data
add column age int ;

update hr_data
set age  = timestampdiff(YEAR,birthdate,curdate());

select birthdate , age from hr_data;

Select min(age) youngest, Max(age) as Oldest
from hr_data


