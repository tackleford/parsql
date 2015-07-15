/* Full time first time degree seeking student subquery receiving aid, excluding "other". Also omits Work Study--group 2b */

select a.year, a.unit, a.division, count(distinct a.student_ssn)
from

(select year, unit,division, student_ssn
			from UWSA.STUDENT_ANALYTICAL
			where year = '201213' and
			term = '1' and
			Classif in ('A','B','C','D') AND 
			tot_minus_study_away_flag = 'Y' and
			tot_minus_study_away_part_time = 'N' and
			entr_status = 'N' 
		
					group by year, unit,division,student_ssn) a,

					UWSA.STFA_AID_A
					
					where
				 (UWSA.STFA_AID_A.FIN_AID_TYPE not in ('13','14','15','67','70','71','72','76','94','95','96','97','99','20','46','63','75','83','84','76')) and 
					UWSA.STFA_AID_A.year = '201213' and 
					 UWSA.STFA_AID_A.student_ssn = a.student_ssn and 
					  UWSA.STFA_AID_A.unit  = a.unit  and 
				  UWSA.STFA_AID_A.Division = a.division

group by a.year, a.unit, a.division 
					  
;
`
			