require_relative './lib/db'

db_name = (ENV['DB_ENV'] == 'test' ? 'chitter_test' : 'chitter')
DB.setup(db_name)
