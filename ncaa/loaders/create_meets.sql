begin;

drop table if exists ncaa.meets;

create table ncaa.meets (
	match_date	      date,
	location	      text,
	teams		      integer,
	primary key (match_date,location)
);

insert into ncaa.meets
(match_date,location,teams)
(
select
match_date,
location,
count(*) as teams
from ncaa.matches
group by match_date,location
);

commit;
