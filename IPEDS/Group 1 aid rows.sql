/* Undergraduate query--Group 1*/ 
/* Undergraduate query--Group 1 
Grant aid plus federal loan s  */

/* run three times */

		
   select a.year, a.unit, a.division,count (distinct a.student_ssn), sum(uwsa.stfa_aid_a.fin_aid_amount)
   from  
    (select year, unit,division,student_ssn
			from UWSA.STUDENT_ANALYTICAL
			where year = '201314' and
			term = '1' and
			tot_minus_study_away_stdnt_lvl < '3' AND 
			ipeds_flag = 'Y' 
			
					group by year, unit,division,student_ssn) a,
						UWSA.STFA_AID_A
						where 
						  UWSA.STFA_AID_A.year = '201314' and 
					     UWSA.STFA_AID_A.student_ssn = a.student_ssn and 
					     UWSA.STFA_AID_A.unit  = a.unit  and 
				        UWSA.STFA_AID_A.Division = a.division   and
/* Pell grants */
	/* 			        UWSA.STFA_AID_A.FIN_AID_TYPE = 24    */
	/* Grant aid */
 /* UWSA.STFA_AID_A.FIN_AID_TYPE  in ('10','11','12','16','17','18','19','21','22','24','25','28','29','31','34','31','33','37','38','39','41','42','43','44','45','46','47','48','74','75','83','84','85')     */
  
  /* Title IV loan aid */			      
 UWSA.STFA_AID_A.FIN_AID_TYPE  in ('54','56','57','91','92' ) 
group by a.year, a.unit, a.division 
				        
				

`