select
name,
type,
(case when round in ('k1','k2') then 'kneeling'
      when round in ('p1','p2') then 'prone'
      when round in ('s1','s2') then 'standing'
end) as position,
avg(score::float)::numeric(4,2) as avg
from ncaa.scores
where type='smallbore'
and score is not null
group by name,type,position
order by position,avg desc;

