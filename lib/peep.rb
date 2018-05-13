require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-core'
require 'dm-validations'
require 'dm-migrations'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :username, String
  property :created_at, DateTime


  def time
    self.created_at.strftime("%H:%M")
  end

  if ENV['ENVIRONMENT'] == 'test'
    DataMapper.setup(:default, 'postgres://localhost/chitter_development')
    DataMapper.finalize
  else
    DataMapper.setup(:default, 'postgres://localhost/chitter')
    DataMapper.finalize
  end

  # belongs_to :user, :required => false

end
