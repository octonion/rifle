select
ltrim(factor,'name') as name,
s.team,
exp(estimate)::numeric(6,3) as p
from ncaa._basic_factors
join ncaa.shooters s
on s.name=ltrim(factor,'name')
where factor like 'name%'
order by p desc;

copy (
select
ltrim(factor,'name') as name,
s.team,
exp(estimate)::numeric(6,3) as p
from ncaa._basic_factors
join ncaa.shooters s
on s.name=ltrim(factor,'name')
where factor like 'name%'
order by p desc
) to '/tmp/air_rifle.csv' csv header;

