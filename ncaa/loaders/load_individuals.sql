begin;

drop table if exists ncaa.individuals;

create table ncaa.individuals (
	match_date	      date,
	location	      text,
	first_name	      text,
	last_name	      text,
	school		      text,
	sb_total	      integer,
	sb_centers	      integer,
	sb_squaded	      boolean,
	ar_total	      integer,
	ar_centers	      integer,
	ar_squaded	      boolean
);

copy ncaa.individuals from '/tmp/individuals.tsv' with delimiter as E'\t' csv;

update ncaa.individuals
set sb_total=NULL
where sb_total=0;

update ncaa.individuals
set sb_centers=NULL
where sb_centers=0;

update ncaa.individuals
set ar_total=NULL
where ar_total=0;

update ncaa.individuals
set ar_centers=NULL
where ar_centers=0;

commit;
