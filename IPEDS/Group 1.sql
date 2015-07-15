/* 2015-=1-8: Use IPEDS flag */

/* Undergraduate query--Group 1 */
		select year, unit,division,count (distinct student_ssn)
			from UWSA.STUDENT_ANALYTICAL
			where year = '201314' and
			term = '1' and
			tot_minus_study_away_stdnt_lvl < '3' AND 
			ipeds_flag = 'Y' 
			
					group by year, unit,division
				;
		`