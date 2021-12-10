require 'yaml'
require 'active_record'


environment = ENV['RACK_ENV'] || 'development'
db_config = YAML::load_file('config/database.yaml')
ActiveRecord::Base.establish_connection(db_config[environment])

class Book < ActiveRecord::Base

end

Book.columns.each { |column|
  puts column.name
  puts column.type
}