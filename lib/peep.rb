require 'data_mapper'
#require 'dm-postgres-adapter'
require_relative '../database_connection_setup.rb'

class Peep
  include DataMapper::Resource

  #belongs_to :user

  attr_reader :id, :content, :created_at


  property :id,           Serial
  property :content,      Text,   length: 1..140,   lazy: false
  property :created_at,   DateTime

  DataMapper.finalize

  def self.add(content)
    Peep.create(
      content: content,
      created_at: Time.now
    )
  end

  def self.reverse_chron_order_peeps
    Peep.all(order: [:created_at.desc])
  end
end
