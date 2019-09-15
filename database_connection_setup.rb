require 'active_record'

def setup_test_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitter_test'
  )
end

def setup_prod_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitter'
  )
end

ENV['DB_ENV'] == 'test' ? setup_test_connection : setup_prod_connection
