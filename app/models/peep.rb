# require_relative '../data_mapper_setup.rb'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'
require 'dm-timestamps'

class Peep
  include DataMapper::Resource

  attr_reader :body

  # has n, :users, through: Resource
  belongs_to :user#, 'User',
    # parent_key: [:username],
    # child_key: [:body]

  property :id, Serial
  property :body, String, required: true
  property :created_at, DateTime
  property :updated_at, DateTime
  # property :posted, DateTime, :default => lambda{ |p,s| DateTime.now}

end
