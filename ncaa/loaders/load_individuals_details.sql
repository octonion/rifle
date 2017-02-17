begin;

drop table if exists ncaa.individuals_details;

create table ncaa.individuals_details (
	name		      text,
	team		      text,
	match_date	      date,
	location	      text,
	k1		      integer,
	k2		      integer,
	p1		      integer,
	p2		      integer,
	s1		      integer,
	s2		      integer,
	sb_total	      integer,
	sb_centers	      integer,
	a1		      integer,
	a2		      integer,
	a3		      integer,
	a4		      integer,
	a5		      integer,
	a6		      integer,
	ar_total	      integer,
	ar_centers	      integer
);

copy ncaa.individuals_details from '/tmp/individuals_details.tsv' with delimiter as E'\t' csv;

update ncaa.individuals_details
set k1=NULL
where k1=0;

update ncaa.individuals_details
set k2=NULL
where k2=0;

update ncaa.individuals_details
set p1=NULL
where p1=0;

update ncaa.individuals_details
set p2=NULL
where p2=0;

update ncaa.individuals_details
set s1=NULL
where k1=0;

update ncaa.individuals_details
set s2=NULL
where k2=0;

update ncaa.individuals_details
set sb_total=NULL
where sb_total=0;

update ncaa.individuals_details
set sb_centers=NULL
where sb_centers=0;

update ncaa.individuals_details
set a1=NULL
where a1=0;

update ncaa.individuals_details
set a2=NULL
where a2=0;

update ncaa.individuals_details
set a3=NULL
where a3=0;

update ncaa.individuals_details
set a4=NULL
where a4=0;

update ncaa.individuals_details
set a5=NULL
where a5=0;

update ncaa.individuals_details
set a6=NULL
where a6=0;

update ncaa.individuals_details
set ar_total=NULL
where ar_total=0;

update ncaa.individuals_details
set ar_centers=NULL
where ar_centers=0;

commit;
