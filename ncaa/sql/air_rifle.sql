select
name,
type,
avg(score::float)::numeric(4,2) as avg
from ncaa.scores
where type='air_rifle'
and score is not null
group by name,type
order by avg desc;
