worker: bundle exec rake setup_development_db

worker: bundle exec rake migrate_development

web: bundle exec puma -t 5:5 -p ${PORT:-4567} -e ${RACK_ENV:-development}
