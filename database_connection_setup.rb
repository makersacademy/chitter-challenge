require 'active_record'
require './db/migrate/20190915183254_create_user'
require './db/migrate/20190915183246_create_peeps'

def setup_test_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitter_test'
  )

  drop_test_tables
  create_test_tables
end

def drop_test_tables
  CreatePeeps.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:peeps)
  CreateUser.migrate(:down) if ActiveRecord::Base.connection.table_exists?(:users)
end

def create_test_tables
  CreateUser.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:users)
  CreatePeeps.migrate(:up) unless ActiveRecord::Base.connection.table_exists?(:peeps)
end

def setup_prod_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitter'
  )
end

ENV['DB_ENV'] == 'test' ? setup_test_connection : setup_prod_connection
