require 'data_mapper'

DB_USER = 'jon'

if ENV['ENVIRONMENT'] == 'test'
  DATABASE_URL = "postgres://#{DB_USER}@localhost/chitter_test"
else
  DATABASE_URL = "postgres://#{DB_USER}@localhost/chitter"
end

DataMapper.setup(:default, DATABASE_URL)

class Peep
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :peep, String
  property :peep_time, Time

  belongs_to :user

  def inspect
    "<#{self.class}: #{id}, #{peep}, #{peep_time}>"
  end 
end

class User
  include DataMapper::Resource

  property :id, Serial, :key => true
  property :name, String
  property :username, String
  property :email, String
  property :password, String

  has n, :peeps

  def inspect
    "<#{self.class}: #{id}, #{name}, #{username}, #{email}, #{password}>"
  end 
end

User.auto_upgrade!
Peep.auto_upgrade!
