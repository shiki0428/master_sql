select shohin_id,shohin_mei,hanbai_tanka,
	AVG(hanbai_tanka) over W as moving_avg
	from shohin
	window W 
	as (order by shohin_id
						rows between 2 preceding
								and current row);
								
								
select shohin_id,shohin_mei,hanbai_tanka,
		avg(hanbai_tanka) over w as moving_avg,
		sum(hanbai_tanka) over w as moving_sum,
		count(hanbai_tanka) over w as moving_count,
		max(hanbai_tanka) over w as moving_max
	from shohin 
	window w as (order by shohin_id
					rows between 2 preceding 
							and current row);
							
						
						
						
select sample_date as cur_date,
	min(sample_date)
		over(order by sample_date asc
				rows between 1 preceding and 1 preceding) as latest_date
	from loadsample;
	
	
select sample_date as cur_date,
	load_val as cur_load,
	min(sample_date) over (order by sample_date asc rows between 1 preceding and 1 preceding) as latest_date,
	max(load_val) over (order by sample_date asc rows between 1 preceding and 1 preceding) as latest_load
	from loadsample;
	