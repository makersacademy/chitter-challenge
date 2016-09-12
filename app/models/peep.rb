require_relative '../data_mapper_setup'
require 'dm-timestamps'  #provides automatic updates of created_at

class Peep
  include DataMapper::Resource

  belongs_to :user

  property :id,         Serial
  property :title,      String
  property :posted_by,  String
  property :created_at, DateTime
  property :body,       Text
end
