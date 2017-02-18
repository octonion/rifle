begin;

create temporary table a (
	school		      text,
	location	      text,
	n		      integer,
	primary key (school,location)
);

insert into a
(
select
school,
location,
count(*)
from ncaa.individuals
group by school,location
);

drop table if exists ncaa.home;

create table ncaa.home (
	school		      text,
	home_location	      text,
	primary key (school)
);

insert into ncaa.home
(school,home_location)
(
select
school,
location
from a
where (school,n)
in
(
select school,max(n) as max_n
from a
group by school
)
and school not in
(
'North Georgia','North Carolina St.','Akron','Ga. Southern',
'Alabama Birmingham','John Jay','Coast Guard','UT Martin',
'UT Martin (W)'
)

);

insert into ncaa.home
(school,home_location)
values
('North Georgia','Dahlonega GA'),
('North Carolina St.','Raleigh NC'),
('Akron','Akron OH'),
('Ga. Southern','Unkown XX'),
--('Alabama Birmingham',
--('John Jay',
('Coast Guard','New London CT'),
('UT Martin','Martin TN'),
('UT Martin (W)','Martin TN');

commit;
