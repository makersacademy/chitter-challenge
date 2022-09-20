require 'active_record'
require './lib/peep'
require './lib/user'

db_options = YAML.load(File.read('./config/db_development.yml'))
ActiveRecord::Base.establish_connection(db_options)
