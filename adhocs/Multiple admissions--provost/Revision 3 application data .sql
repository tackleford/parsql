/* Applications.
 Comleted applications only
*/ 

select  b.student_ssn,a.unit,a.division, b.TotApplications,a.year
FROM
(
Select    V_Maad_Applicant_Race_Status.student_ssn,v_maad_applicant_race_status.unit, v_maad_applicant_race_status.division, v_maad_applicant_race_status.year
FROM UWSA.V_Maad_Applicant_Race_Status 
WHERE V_Maad_Applicant_Race_Status.Year in('201314', '201415','201213', '201112','201011','200910','200809','200708') 
	AND V_Maad_Applicant_Race_Status.Term IN ('1', 'S') 
	AND V_Maad_Applicant_Race_Status.Entr_Status='N' 
		AND V_Maad_Applicant_Race_Status.Month='XX'
	AND v_maad_applicant_race_status.admission_action IN ('10','11','14','15','12','20','21','22') 
group by unit,division,year,student_ssn
	order by unit ) a,
	
/*	(Select   V_Maad_Applicant_Race_Status.student_ssn, count(*) TotAdmits, V_Maad_Applicant_Race_Status.Year */
(Select   V_Maad_Applicant_Race_Status.student_ssn, count(distinct v_maad_applicant_race_status.unit) TotApplications, V_Maad_Applicant_Race_Status.Year
FROM UWSA.V_Maad_Applicant_Race_Status 
WHERE V_Maad_Applicant_Race_Status.Year in('201314', '201415','201213', '201112','201011','200910','200809','200708')
	AND V_Maad_Applicant_Race_Status.Term IN ('1', 'S') 
	AND V_Maad_Applicant_Race_Status.Entr_Status='N' 
		AND V_Maad_Applicant_Race_Status.Month='XX'
	AND v_maad_applicant_race_status.admission_action IN ('10','11','14','15','12','20','21','22') 
group by student_ssn,year
	order by year,student_ssn ) b
	
Where (a.student_ssn = b.student_ssn)	
 	and (a.year=b.year)
group by b.student_ssn,a.unit, a.division,b.TotApplications, a.year
order by  b.student_ssn

`