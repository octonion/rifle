begin;

drop table if exists ncaa.meets;

create table ncaa.meets (
        meet_id		      serial,
	match_date	      date,
	location	      text,
	teams		      integer,
	primary key (meet_id),
	unique (match_date,location)
);

insert into ncaa.meets
(match_date,location,teams)
(
select
match_date,
location,
count(*) as teams
from (
select distinct match_date,location,team
from ncaa.individuals_details
) i
group by match_date,location
order by match_date,location
);

commit;
