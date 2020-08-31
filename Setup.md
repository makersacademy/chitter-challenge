# Set-up the APP

## 1. To get all dependencies run

- bundle install

## 2. create test and development db (use PostgreSQL)

- rake db:create

## 3. migrate development db

- rake db:migrate

## 4. migrate the test db

- rake db:migrate RACK_ENV=test

## 5. Run "rspec" in terminal (from the app dir) to check if all tests pass

- rspec

## 6. Run the app in the terminal with rack

- rackup -p 4567
