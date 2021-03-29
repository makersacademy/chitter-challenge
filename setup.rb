require 'dotenv'
require 'rom'
require './db/db'

Dotenv.load

# manually doing migration style setup to increase understanding of how this works
def database_setup(db)
  rom = ROM.container(:sql, "postgres://localhost/#{db}") do |config|
    config.gateways[:default].create_table(:users) do
      primary_key :id
      column :user_name, String, null: false
      column :password, String, null: false
      column :email, String, null: false
      column :name, String, null: false
    end

    config.gateways[:default].create_table(:peeps) do
      primary_key :id
      foreign_key :user_id, :users
      column :content, String, null: false
      column :created_at, DateTime
    end

    require './db/relations/users'
    require './db/relations/peeps'
    config.register_relation(Users, Peeps)
  end
end

database_setup(ENV.fetch('POSTGRESQL_DB'))
ENV['RACK_ENV'] = 'test'
database_setup(ENV.fetch('POSTGRESQL_TEST_DB'))
