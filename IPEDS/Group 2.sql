/* 2015-=1-8: Use IPEDS flag */




/* Full time first time degree seeking student subquery--group 2 */
select year, unit,division, count(distinct student_ssn),
  decode(res_status,'R','Resident','Non-Resident')
			from UWSA.STUDENT_ANALYTICAL
			where year = '201314' and
			term = '1' and
			Classif in ('A','B','C','D') AND 
			ipeds_flag = 'Y' and
			ipeds_part_time = 'N' and
			entr_status = 'N'
		
					group by year, unit,division,decode(res_status,'R','Resident','Non-Resident')   ;
					`
					
					
/* Legacy code reject--carry over				
where ("UWSA"."STFA_AID_A"."FIN_AID_TYPE" not in ('13','14','15','67','70','71','72','76','94','95','96','97','99')) and 

*/
 /* Legacy code reject-"other" financial aid source
 and stfa_aid_a.fin_aid_type not in ('20','46','63','75','83','84')     */