begin;

drop table if exists ncaa.individuals;

create table ncaa.individuals (
	match_date	      date,
	location	      text,
	first_name	      text,
	last_name	      text,
	school		      text,
	sb_total	      integer,
	sb_center	      integer,
	sb_squaded	      boolean,
	ar_total	      integer,
	ar_center	      integer,
	ar_squaded	      boolean
);

copy ncaa.individuals from '/tmp/individuals.tsv' with delimiter as E'\t' csv;

commit;
