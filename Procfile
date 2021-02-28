worker: bundle exec rake setup_databases

worker: bundle exec rake migrate_database_tables

web: bundle exec puma -t 5:5 -p ${PORT:-4567} -e ${RACK_ENV:-development}
