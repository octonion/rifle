select s.school,s.sbt,a.art,(s.sbt+a.art) total
from
(select school,
avg(sb_total)::numeric(5,2) as sbt
from ncaa.individuals
where
    sb_squaded
and sb_total>0 group by school) s
join
(select school,
avg(ar_total)::numeric(5,2) as art
from ncaa.individuals
where
    ar_squaded
and ar_total>0 group by school) a
on (a.school)=(s.school)
order by total desc;
