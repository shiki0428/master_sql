select case pref_name
		when '徳島' then '四国'
		when '香川' then '四国'
		when '愛媛' then '四国'
		when '高知' then '四国'
		when '福岡' then '九州'
		when '佐賀' then '九州'
		when '長崎' then '九州'
	else 'その他' end as district,
	sum(population)
	from poptbl
group by district
	
	
	
select * from Poptbl2

explain select pref_name,
	sum(population)
from poptbl2
where sex = '1'
group by pref_name
union 
select pref_name,
	sum(population)
from poptbl2
where sex = '2'
group by pref_name

select pref_name,
	case when sex = '1' then population else 0 end as cnt_m,
	case when sex = '2' then population else 0 end as cnt_f
from poptbl2 
group by pref_name

select * from personnel

update personnel
set salary = case when salary >= 300000
				then salary * 0.9
				when salary >= 250000 and salary < 280000
				then salary * 1.2
			else null end;

select * from sometable

update sometable
	set p_key = case when p_key = 'a'
					then 'b'
					when p_key = 'b'
					then 'a'
				else p_key end
	where p_key in ('a', 'b')
	
	
	
select * from coursemaster
	
select * from opencourses

67
explain analyze select 
course_name,
	case when course_id in
		( select course_id 
		 from opencourses where month = 201806
		) then 'O'
		else 'X' end as "6月",
	case when course_id in
		( select course_id 
		 from opencourses where month = 201807
		) then 'O'
		else 'X' end as "7月"		,
	case when course_id in
		( select course_id 
		 from opencourses where month = 201808
		) then 'O'
		else 'X' end as "8月"

from coursemaster

17429
explain analyze select cm.course_name,
		case when exists
			(select course_id from opencourses oc
				where month = 201806
					and oc.course_id = cm.course_id) then 'O'
		else 'X' end as "六月",
		case when exists
			(select course_id from opencourses oc
				where month = 201807
					and oc.course_id = cm.course_id) then 'O'
		else 'X' end as "七月",
		case when exists
			(select course_id from opencourses oc
				where month = 201808
					and oc.course_id = cm.course_id) then 'O'
		else 'X' end as "八月"
from coursemaster cm;

select * from studentclub

select std_id,
	case when count(*) = 1
		then max(club_id)
	else max(case when main_club_flg = 'Y'
						then club_id
						else null end) end as main_club
	from studentclub
	group by std_id;
	
	
create table Greatests(
key varchar(32) primary key,
x integer,
y integer,
z integer);

insert into Greatests values
('A',1,2,3),
('B',5,5,2),
('C',4,7,1),
('D',3,3,8)

select key,
	case when x >= y 
		then case when x >= z
				then x 
		else z end
	when y >= x
		then case when y >= z
				then y
		else z end
	else z end as greatest
from greatests

select * from poptbl2

select pref_name,
	case when sex = '1' then population else 0 end as cnt_m,
	case when sex = '2' then population else 0 end as cnt_f
from poptbl2 
group by pref_name

select case when sex = '1' then '男'
				else '女' end as "性別",
		sum(case when pref_name = '徳島' then population
			else 0 end) as "徳島",
		sum(case when pref_name = '香川' then population
			else 0 end) as "香川",				
		sum(case when pref_name = '愛媛' then population
			else 0 end) as "愛媛",
		sum(case when pref_name = '高知' then population
			else 0 end) as "高知",
		sum(case pref_name
				when '徳島' then population
				when '香川' then population
				when '愛媛' then population
				when '高知' then population
			else 0 end) as "四国"
from poptbl2
group by "性別"


