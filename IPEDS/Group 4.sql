/* Full time first time degree seeking student subquery receiving Title IV aid Resident only. Group 4*/

select a.year, a.unit, a.division, count(distinct a.student_ssn)
from

(select year, unit,division, student_ssn
			from UWSA.STUDENT_ANALYTICAL
			where year = '201314' and
			term = '1' and
			res_status = 'R' and
			Classif in ('A','B','C','D') AND 
			tot_minus_study_away_flag = 'Y' and
			tot_minus_study_away_part_time = 'N' and
			entr_status = 'N' 
		
					group by year, unit,division,student_ssn) a,

					UWSA.STFA_AID_A
					
					where
				 
				 (UWSA.STFA_AID_A.FIN_AID_TYPE  in ('24','28','31','41','43','54','56','57','76','91','92')) and 
					UWSA.STFA_AID_A.year = '201314' and 
					 UWSA.STFA_AID_A.student_ssn = a.student_ssn and 
					  UWSA.STFA_AID_A.unit  = a.unit  and 
				  UWSA.STFA_AID_A.Division = a.division

group by a.year, a.unit, a.division 
					  
;
`
			