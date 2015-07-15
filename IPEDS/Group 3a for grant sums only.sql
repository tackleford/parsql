/* Full time first time degree seeking student subquery receiving grant aid, excluding "other". Resident only. Group 3*/
/* removing housing arrangements, as not needed in grant summary */

select a.year, a.unit, a.division, count(distinct a.student_ssn),sum(uwsa.stfa_aid_a.fin_aid_amount)

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
				 (UWSA.STFA_AID_A.FIN_AID_TYPE not in ('13','14','27','15','67','70','71','72','76','94','95','96','97','99','20','46','63','75','83','84','76')) and 
				 (UWSA.STFA_AID_A.FIN_AID_TYPE  in ('10','11','12','16','17','18','19','21','22','24','25','28','29','31','34','33','35','36','37','38','39','41','42','43','44','45','47','48','74','85')) and 
					UWSA.STFA_AID_A.year = '201314' and 
					 UWSA.STFA_AID_A.student_ssn = a.student_ssn and 
					  UWSA.STFA_AID_A.unit  = a.unit  and 
				  UWSA.STFA_AID_A.Division = a.division  
				

group by a.year, a.unit, a.division
					  
;
`
			