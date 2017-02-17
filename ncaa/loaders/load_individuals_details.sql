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

commit;
