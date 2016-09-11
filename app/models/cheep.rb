require_relative '../data_mapper_setup'
require_relative 'user'

class Cheep
  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text, required: true
  property :created_at, DateTime,  required: true
  property :posted_by,  String
  property :handle,  String


  belongs_to :user

end
