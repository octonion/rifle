begin;

drop table if exists ncaa.shooters;

create table ncaa.shooters (
	name		      text,
	team		      text,
	meets		      integer,
	primary key (name,team)
);

insert into ncaa.shooters
(name,team,meets)
(
select
name,
team,
count(*) as meets
from ncaa.individuals_details
group by name,team
);

commit;
