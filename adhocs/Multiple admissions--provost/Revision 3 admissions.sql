select b.student_ssn,a.unit, count(*)
FROM
(
Select   V_Maad_Applicant_Race_Status.student_ssn,v_maad_applicant_race_status.unit, v_maad_applicant_race_status.division
FROM UWSA.V_Maad_Applicant_Race_Status 
WHERE V_Maad_Applicant_Race_Status.Year='201314'
	AND V_Maad_Applicant_Race_Status.Term IN ('1', 'S') 
	AND V_Maad_Applicant_Race_Status.Entr_Status='N' 
		AND V_Maad_Applicant_Race_Status.Month='XX'
		AND v_maad_applicant_race_status.admission_action IN ('10','11','14','15')
group by student_ssn,unit,division
	order by student_ssn ) a,
	
	
(Select   V_Maad_Applicant_Race_Status.student_ssn
FROM UWSA.V_Maad_Applicant_Race_Status 
WHERE V_Maad_Applicant_Race_Status.Year='201314'
	AND V_Maad_Applicant_Race_Status.Term IN ('1', 'S') 
	AND V_Maad_Applicant_Race_Status.Entr_Status='N' 
		AND V_Maad_Applicant_Race_Status.Month='XX'
		AND v_maad_applicant_race_status.admission_action IN ('10','11','14','15')
group by student_ssn
	order by student_ssn ) b
	
Where (a.student_ssn = b.student_ssn)	

group by b.student_ssn,a.unit, a.division
order by b.student_ssn

`