begin;

drop table if exists ncaa.matches;

create table ncaa.matches (
	match_date	      date,
	school_name	      text,
	location	      text,
	team_type	      text,
	team_sb_total	      integer,
	team_sb_centers	      integer,
	team_ar_total	      integer,
	team_ar_centers	      integer,
	team_squad_total      integer,
	team_squad_centers    integer,
	primary key (match_date,school_name,location)
);

copy ncaa.matches from '/tmp/matches.tsv' with delimiter E'\t' csv;

update ncaa.matches
set team_sb_total=NULL
where team_sb_total=0;

update ncaa.matches
set team_sb_centers=NULL
where team_sb_centers=0;

update ncaa.matches
set team_ar_total=NULL
where team_ar_total=0;

update ncaa.matches
set team_ar_centers=NULL
where team_ar_centers=0;

update ncaa.matches
set team_squad_total=NULL
where team_squad_total=0;

update ncaa.matches
set team_squad_centers=NULL
where team_squad_centers=0;

--alter table ncaa.games add column game_id serial primary key;

--update ncaa.games
--set game_length = trim(both ' -' from game_length);

commit;
