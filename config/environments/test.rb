
require 'active_record'

db_options = YAML.load(File.read('./config/test_database.yml'))
ActiveRecord::Base.establish_connection(db_options)
