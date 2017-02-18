begin;

-- Add primary key to deduplicated box_scores_fielding table

--alter table ncaa_pbp.box_scores_fielding
--add primary key (game_id,section_id,player_name,position);

alter table ncaa.individuals_details
add column meet_id integer;

update ncaa.individuals_details
set meet_id=m.meet_id
from ncaa.meets m
where (m.match_date,m.location)=
      (individuals_details.match_date,individuals_details.location);

commit;
