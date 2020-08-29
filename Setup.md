Create PostgreSQL db

## create test and development db

rake db:create

## migrate development db

rake db:migrate

## migrate the test db

rake db:migrate RACK_ENV=test

## Run "rspec" in terminal to check if test are passed

rspec
