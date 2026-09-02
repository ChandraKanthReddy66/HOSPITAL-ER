use [Hospital_ER_Data]


--- 1 . No of Patients 
Select Count(*) as No_of_patients from [Hospital_ER_Data]


---2  Average Wait Time:
Select concat(AVG(patient_waittime),'   Min') as avg_wait_time from [Hospital_ER_Data]

--3 Patient Satisfaction Score:
Select AVG(Patient_Satisfaction_Score) as avg_wait_time from [Hospital_ER_Data]

-----4	Number of Patients Referred:
Select count(patient_id) as no_of_patients from [Hospital_ER_data] Hr JOIN Departments D
on Hr.DepartmentID = D.DepartmentID
Where Department_Referral <> 'none'
and 
year(Patient_Admission_Date) = 2023  
and 
Month(Patient_Admission_Date) = 4



--- Patient Admission Status: Track admitted vs. non-admitted patients.


Select 
	Case 
		When patient_admission_flag = 'True' Then 'Admited' 
		else 'Not_Admited'
		End  as Admission_Status ,
		COUNT(PATIENT_ID) AS No_of_Patients
fROM [Hospital_ER_Data]
where YEAR(Patient_Admission_Date) = 2023 
and 
month(Patient_Admission_Date) = 4
Group By 
Case 
		When patient_admission_flag = 'True' Then 'Admited' 
		else 'Not_Admited'
		End

--- •	Department Referrals: Analyze referral trends across different departments.

Select Department_Referral , count(patient_id) as No_of_Patients  
from [Hospital_ER_Data] Hr Join Departments D 
on Hr.DepartmentID = D.DepartmentID
where year(patient_admission_date) = 2023 and MONTH(patient_admission_date) = 4 
group by Department_Referral
order by No_of_Patients Desc 


---- weekname wise no of patients 

Select DATENAME(weekday,Patient_Admission_Date) as Weekname, 
datepart(hour,(Patient_Admission_Date)) as hourrange ,
cOUNT(Patient_id) as  no_of_patients from [Hospital_ER_Data]
where YEAR(Patient_Admission_Date) = 2023 and MONTH(Patient_Admission_Date)=4
group by DATENAME(weekday,Patient_Admission_Date),datepart(hour,(Patient_Admission_Date))

select*from [Hospital_ER_Data ]
