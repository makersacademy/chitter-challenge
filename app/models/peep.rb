require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  attr_reader :body, :created_at

  belongs_to :user

  property :id, Serial
  property :body, String, required: true
  property :created_at, DateTime
  property :updated_at, DateTime
  # property :posted, DateTime, :default => lambda{ |p,s| DateTime.now}

end
