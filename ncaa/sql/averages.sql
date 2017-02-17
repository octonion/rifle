select
name,
team,
avg(ar_total)::numeric(5,2) as art,
avg(ar_centers)::numeric(4,2) as arc,
count(*) as n
from ncaa.individuals_details
where ar_total is not null
group by name,team
order by avg(ar_total) desc;

select
name,
team,
avg(sb_total)::numeric(5,2) as sbt,
avg(sb_centers)::numeric(4,2) as sbc,
count(*) as n
from ncaa.individuals_details
where sb_total is not null
group by name,team
order by avg(sb_total) desc nulls last;
