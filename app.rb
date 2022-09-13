$LOAD_PATH << File.join(File.dirname(__FILE__), '/lib')

require 'application'

db_options = {adapter: 'sqlite3', database: 'chitter'}
ActiveRecord::Base.establish_connection(db_options)

app = Application.new