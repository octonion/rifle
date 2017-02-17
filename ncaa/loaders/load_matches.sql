begin;

drop table if exists ncaa.matches;

create table ncaa.matches (
	match_date	      date,
	school_name	      text,
	location	      text,
	team_type	      text,
	team_sb_total	      integer,
	team_sb_center	      integer,
	team_ar_total	      integer,
	team_ar_center	      integer,
	team_squad_total      integer,
	team_squad_center     integer
);

copy ncaa.matches from '/tmp/matches.tsv' with delimiter E'\t' csv;

--alter table ncaa.games add column game_id serial primary key;

--update ncaa.games
--set game_length = trim(both ' -' from game_length);

commit;
