require 'dm-core'
require 'dm-timestamps'

class Message
include DataMapper::Resource

property :id,     Serial
property :message,  String
property :created_at, DateTime

belongs_to :user

end
