require 'active_record'
require 'rack/test'
require 'bcrypt'
require './lib/peep'
require './lib/user'

db_options = YAML.load(File.read('./config/db_test.yml'))
ActiveRecord::Base.establish_connection(db_options)
