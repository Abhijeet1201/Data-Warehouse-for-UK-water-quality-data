--QUERY 1

SELECT T.SAMPLE_DATE,T.SAMPLE_MONTH, d.determinand_label,d.determinand_id,s.result FROM DETERMINAND_DIM D JOIN FACT_TABLE S ON d.determinand_id=s.determinand_id
JOIN TIME_DIM T ON t.time_id =s.time_id ORDER BY d.determinand_id,T.SAMPLE_MONTH;

--QUERY 2.

SELECT d.determinand_id, d.determinand_label,T.SAMPLE_DATE,t.SAMPLE_WEEK, SUM(s.result) FROM DETERMINAND_DIM D JOIN FACT_TABLE S ON d.determinand_id=s.determinand_id
JOIN TIME_DIM T ON t.time_id=s.time_id GROUP BY T.SAMPLE_DATE,t.SAMPLE_WEEK, d.determinand_unit_label,d.determinand_id
ORDER BY d.determinand_id,t.SAMPLE_WEEK;


--QUERY 3

SELECT L.SAMPLE_POINT_LABEL,t.SAMPLE_WEEK,SUM(s.result) FROM SAMPLE_DIM L JOIN FACT_TABLE S ON L.SAMPLE_ID=s.SAMPLE_ID
JOIN TIME_DIM T ON t.time_id=s.time_id GROUP BY T.SAMPLE_DATE,t.SAMPLE_WEEK,L.SAMPLE_POINT_LABEL,t.SAMPLE_WEEK HAVING SUM(s.result)>0;



---Query 4 
SELECT AVG(S.RESULT), d.determinand_label,t.SAMPLE_YEAR FROM DETERMINAND_DIM D JOIN FACT_TABLE S ON d.determinand_id = s.determinand_id
JOIN TIME_DIM T ON t.time_id=s.time_id WHERE d.determinand_label LIKE 'pH' GROUP BY d.determinand_label,d.determinand_id,t.SAMPLE_YEAR;


--Query 5
SELECT round(AVG(S.RESULT),2) as average , d.determinand_label,l.SAMPLING_POINT_LABEL,t.SAMPLE_YEAR FROM SAMPLE_DIM
l,DETERMINAND_DIM D full JOIN FACT_TABLE S ON d.determinand_id=s.determinand_id
full JOIN TIME_DIM T ON t.time_id=s.time_id WHERE d.determinand_label
LIKE '%itrate%' GROUP BY d.determinand_label,d.determinand_id,lSSAMPLING_POINT_LABEL,t.SAMPLE_YEAR;
ORDER BY d.determinand_id,T.SAMPLE_MONTH
SELECT D.*,s.result FROM DETERMINAND_DIM D,FACT_TABLE S WHERE d.determinand_id=s.determinand_id ORDER BY S.DETERMINAND_ID DESC
JOIN FACT_TABLE S ON d.determinand_id=s.determinand_id

