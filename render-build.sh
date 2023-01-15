set -o errexit

bundle install
bundle exec rake db:migrate
bundle exec rake db:seed