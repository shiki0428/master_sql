select distinct m1.meeting,m2.person
	from meetings m1 cross join meetings m2;
	

select distinct m1.meeting,m2.person
	from meetings m1 cross join meetings m2
	where not exists (
		select * 
			from meetings m3
		where m1.meeting = m3.meeting
		and m2.person = m3.person
	);
	
select distinct m1.meeting,m2.person
	from meetings m1 cross join meetings m2
except 
select meeting, person
	from meetings;
	
select * from testscores

-- 全て５０点以上
-- 50点以下の点数が存在しない

select distinct student_id,subject 
	from testscores ts1
where not exists
	(select * 
	 	from testscores ts2
	 	where ts1.student_id = ts2.student_id
	 	and ts2.score < 50
	);
	
	
select distinct student_id
	from testscores ts1
where subject in ('算数','国語')
	and not exists
		(select *
			from testscores ts2
		where ts2.student_id = ts1.student_id
		 and 1 = case when subject = '算数' and score < 80 then 1
		 			  when subject = '国語' and score < 50 then 1
		 		 else 0 end
		 )
	group by student_id
having count(*) = 2;
		 
		 
select *
	from projects
	
	
select project_id
	from projects
 group by project_id
having count(*) = sum(case when step_nbr <= 1 and status = '完了' then 1
					       when step_nbr > 1 and status = '待機' then 1 
					 	   else 0 end);
		
SELECT *
  FROM Projects P1
 WHERE NOT EXISTS
        (SELECT status
           FROM Projects P2
          WHERE P1.project_id = P2. project_id --プロジェクトごとに条件を調べる
            AND status <> CASE WHEN step_nbr <= 1 --全称文を二重否定で表現する
                               THEN '完了'
                               ELSE '待機' END);
select * from arraytbl

		
SELECT *
  FROM ArrayTbl
WHERE 1 = ALL (array[col1, col2, col3, col4, col5, col6, col7, col8, col9, col10]);

select * from arraytbl
	where 9 in (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10)
	
	
select * from arraytbl
	where coalesce(col1, col2, col3, col4, col5, col6, col7, col8, col9, col10)
		is null
		
		
select distinct key from arraytbl2 at1
where not exists
	(select * from arraytbl2 at2
		where at1.key = at2.key
			and (at2.val <> 1
			or at2.val is not null));

	