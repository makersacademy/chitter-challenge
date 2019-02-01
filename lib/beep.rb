
require 'active_record'
require 'pg'
ActiveRecord::Base.establish_connection(
  adapter:  'postgresql', # or 'postgresql' or 'sqlite3'
  database: ENV['database_hash'],
  host:     'localhost'
)

class Beep < ActiveRecord::Base
end
