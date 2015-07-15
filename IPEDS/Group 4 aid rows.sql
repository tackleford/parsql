/* Full time first time degree seeking student subquery receiving Title IV aid Resident only. Group 4* rewritten for aid rows */

select  d.year,d.unit,d.division, count(distinct d.student_ssn),d.housing_arrangements,  sum(fin.fin_aid_amount),
case 
  when   d.gross_fam_incm <='30000' then 'LE 30000'
  when    d.gross_fam_incm <='48000' then 'LE 48000'
   when   d.gross_fam_incm <='75000' then 'LE 75000'
   when   d.gross_fam_incm <='110000' then 'LE 110000'
   when   d.gross_fam_incm >'110000' then 'GT 110000'
   else 'Unknown'
end 
from
    (select b.year, b.unit, b.division, b.student_ssn,
        c.housing_arrangements,c.gross_fam_incm
        from
        (select a.year, a.unit, a.division, a.student_ssn
        from
                (select year, unit,division, student_ssn
              			from UWSA.STUDENT_ANALYTICAL
              			where year = '201112' and
              			term = '1' and
              			res_status = 'R' and
              			Classif in ('A','B','C','D') AND 
              			tot_minus_study_away_flag = 'Y' and
              			tot_minus_study_away_part_time = 'N' and
              			entr_status = 'N' 
              		
              					group by year, unit,division,student_ssn) a,
              
              					UWSA.STFA_AID_A
              					
              					where
              				  /* received Title IV aid       */
              			/* (UWSA.STFA_AID_A.FIN_AID_TYPE  in ('24','28','31','41','43','54','56','57','76','91','92'))  */    
                       /* Received Title IV grants  */
                    /*  (UWSA.STFA_AID_A.FIN_AID_TYPE  in ('24','28','31','41','43'))    */      
					
					 /* All federal, state, and institutional Grant aid */
					fin.fin_aid_type in 		('10','11','12','16','17','18','19','21','22','24','25','28','29','31','34','33','35','36','37','38','39','41','42','43','44','45','47','48','74','85')  
                       and 
              					UWSA.STFA_AID_A.year = '201112' and 
              					 UWSA.STFA_AID_A.student_ssn = a.student_ssn and 
              					  UWSA.STFA_AID_A.unit  = a.unit  and 
              				  UWSA.STFA_AID_A.division = a.division
              
                        group by a.year, a.unit, a.division,a.student_ssn) b,

          uwsa.stfa_recip_a c

            where b.year='201112' and
          c.year = '201112' and
          b.unit = c.unit and
          b.division =  c.division and
          b.student_ssn = c.student_ssn

          group by b.year, b.unit, b.division, b.student_ssn, c.housing_arrangements,c.gross_fam_incm)d,

uwsa.stfa_aid_a fin

where d.year = fin.year and
  d.student_ssn = fin.student_ssn and
  d.division = fin.division and
  fin.year = '201112' and 
  
  /* Title IV Grants */
  
  /*  fin.FIN_AID_TYPE  in ('24','28','31','41','43')       */
    
  /* Title IV Aid */
/* fin.fin_aid_type in ('24','28','31','41','43','54','56','57','76','91','92')    */
  /* All federal, state, and institutional Grant aid */
 /fin.fin_aid_type in ('10','11','12','16','17','18','19','21','22','24','25','28','29','31','34','33','35','36','37','38','39','41','42','43','44','45','47','48','74','85')  
      
    
  group by    d.year,d.unit,d.division,d.housing_arrangements,

case 
  when   d.gross_fam_incm <='30000' then 'LE 30000'
  when    d.gross_fam_incm <='48000' then 'LE 48000'
   when   d.gross_fam_incm <='75000' then 'LE 75000'
   when   d.gross_fam_incm <='110000' then 'LE 110000'
   when   d.gross_fam_incm >'110000' then 'GT 110000'
   else 'Unknown'
end	  
;
`
			