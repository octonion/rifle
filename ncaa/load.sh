#!/bin/bash

cmd="psql template1 --tuples-only --command \"select count(*) from pg_database where datname = 'rifle';\""

db_exists=`eval $cmd`
 
if [ $db_exists -eq 0 ] ; then
   cmd="createdb rifle;"
   eval $cmd
fi

psql rifle -f schema/schema_ncaa.sql

tail -q -n+2 tsv/matches_[0-9]*.tsv >> /tmp/matches.tsv
psql rifle -f loaders/load_matches.sql
rm /tmp/matches.tsv

tail -q -n+2 tsv/individual_[0-9]*.tsv >> /tmp/individuals.tsv
psql rifle -f loaders/load_individuals.sql
rm /tmp/individuals.tsv

tail -q -n+2 tsv/individual_details_[0-9]*.tsv >> /tmp/individuals_details.tsv
rpl -e 'Sep. ' 'Sep ' /tmp/individuals_details.tsv
rpl -e 'Oct. ' 'Oct ' /tmp/individuals_details.tsv
rpl -e 'Nov. ' 'Nov ' /tmp/individuals_details.tsv
rpl -e 'Dec. ' 'Dec ' /tmp/individuals_details.tsv
rpl -e 'Jan. ' 'Jan ' /tmp/individuals_details.tsv
rpl -e 'Feb. ' 'Feb ' /tmp/individuals_details.tsv
rpl -e 'Mar. ' 'Mar ' /tmp/individuals_details.tsv
psql rifle -f loaders/load_individuals_details.sql
rm /tmp/individuals_details.tsv
