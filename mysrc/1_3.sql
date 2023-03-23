select * from Products

select p1.name as name_1, p2.name as name_2
	from products p1 , products p2;
	
	
	
select p1.name as name_1, p2.name as name_2
	from products p1
	inner join products p2
	on p1.name <> p2.name;
	
select p1.name as name_1,
	   p2.name as name_2,
-- 	   p3.name as name_3
		1
	from products p1
	inner join products p2
		on p1.name > p2.name


-- --重複行を削除する
-- DELETE FROM Products P1 
--  WHERE rowid < ( SELECT MAX(P2.rowid) 
--                    FROM Products P2 
--                   WHERE P1.name = P2. name 
--                     AND P1.price = P2.price );


select * from addresses

select distinct a1.name , a1.address
	from addresses a1
	inner join addresses a2
	on a1.family_id = a2.family_id
	and a1.address <> a2.address;
	
-- ex

select distinct p1.name , p1.price
from products p1
inner join products p2
on p1.price = p2.price
and p1.name <> p2.name
order by p1.price



-- 実行速度に変化はあるのか
-- 実行速度を元に言うのなら　自己非等値結合が一番早い
-- window関数が速いわけではないのが面白い レコード数が多い場合の結果も確認したい
--ランキング算出：ウィンドウ関数の利用 0.096ms
explain analyse SELECT name, price,
       DENSE_RANK() OVER (ORDER BY price DESC) AS rank_2
  FROM Products
  order by rank_2;


--ランキング1位から始まる。同順位が続いた後は不連続 0.085ms
explain analyse SELECT P1.name, P1.price,
       (SELECT COUNT(P2.price)
          FROM Products P2
         WHERE P2.price > P1.price) + 1 AS rank_1
  FROM Products P1 order by rank_1;


--ランキングを求める：自己結合の利用 0.150
explain analyse SELECT P1.name, MAX(P1.price) AS price,
       COUNT(P2.name) +1 AS rank_1
  FROM Products P1 LEFT OUTER JOIN Products P2
    ON P1.price < P2.price 
GROUP BY P1.name
ORDER BY rank_1;


select p1.name as name_1,
	   p2.name as name_2
	from products p1
	inner join products p2
		on p1.name >= p2.name
