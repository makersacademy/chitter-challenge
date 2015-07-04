require "pry"


class Peep

  include DataMapper::Resource

  property :id,     Serial
  property :message,  String
  property :username, String
  property :name, String
  property :created_at, DateTime

  belongs_to :user

end
