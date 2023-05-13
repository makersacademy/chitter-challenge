require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

# I believe the below tells rake where to find the config files when executing db related tasks
namespace :db do
  task :load_config do
    require "./app"
  end
end
