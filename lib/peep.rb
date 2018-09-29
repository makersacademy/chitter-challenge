require 'data_mapper'
require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'dm-migrations'
require 'rubygems'
require_relative 'user'

DataMapper.setup(:default, 'postgres://localhost/chitter')

class Peep
  include DataMapper::Resource

  property :id,         Serial
  property :message,    String,   length: 1..280
  property :created_at, DateTime

  belongs_to :user

  def peep_details=(message)
    @message = message
  end

  def self.view_all
  result = connection.exec("SELECT * FROM peeps")
  result.map do |peep|
    Peep.new(id: peep['id'], message: peep['message'], peep['created_at'])
  end
end

end

DataMapper.finalize
DataMapper.auto_upgrade!
