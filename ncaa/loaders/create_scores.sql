begin;

drop table if exists ncaa.scores;

create table ncaa.scores (
	match_date	      date,
	name		      text,
	team		      text,
	location	      text,
	home		      boolean,
	meet_id		      integer,
	type		      text,
	round		      text,
	score		      integer
);

-- Smallbore

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
'k1' as round,
k1
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
'k2' as round,
k2
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
'p1' as round,
p1
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
'p2' as round,
p2
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
's1' as round,
s1
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'smallbore' as type,
's2' as round,
s2
from ncaa.individuals_details id
);

-- Air Rifle

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a1' as round,
a1
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a2' as round,
a2
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a3' as round,
a3
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a4' as round,
a4
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a5' as round,
a5
from ncaa.individuals_details id
);

insert into ncaa.scores
(match_date,name,team,location,home,meet_id,type,round,score)
(
select
match_date,
name,
team,
location,
(case when location=team then TRUE
      else FALSE end) as home,
meet_id as meet_id,
'air_rifle' as type,
'a6' as round,
a6
from ncaa.individuals_details id
);

commit;
