select
ltrim(factor,'name') as name,
exp(estimate)::numeric(6,3) as p
from ncaa._basic_factors
where factor like 'name%'
order by p desc;

copy (
select
ltrim(factor,'name') as name,
exp(estimate)::numeric(6,3) as p
from ncaa._basic_factors
where factor like 'name%'
order by p desc
) to '/tmp/air_rifle.csv' csv header;

