-- Ex1 
---Solution 1
SELECT 
sum(case 
   when device_type = 'laptop' then 1 
   else 0
end) as laptop_views,
sum(case 
   when device_type IN('tablet','phone') then 1 
   else 0
end) as mobile_views
FROM viewership
---Solution 2
select 
  count(device_type) filter(where device_type = 'laptop') as laptop_views,
  count(device_type) filter(where device_type IN('tablet','phone')) as mobile_views
from viewership
-- Ex 2
select x,y,z,
  case
      when (x+y) > z and (x+z) > y and (y+z) > x then 'Yes'
      else 'No'
  end as triangle 
from Triangle
-- Ex 3
select 
  round(100.0*
    count(case_id)/(select count(*) from callers),1) as call_percentage
from callers
where call_category = 'n/a'
or call_category is null
-- Ex 4
select name
from Customer
where not  referee_id = 2
or referee_id is null
-- Ex 5
select survived,
 sum(case
    when  pclass = 1 then 1
    else 0
 end) as first_class,
 sum(case  
    when pclass = 2 then 1
    else 0
 end) as second_class,
 sum(case
     when pclass = 3 then 1
    else 0
 end) as third_class
from titanic
group by survived
