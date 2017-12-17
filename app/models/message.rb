require 'dm-timestamps'

 class Message

   include DataMapper::Resource

   property :id,       Serial
   property :message,  Text
   property :created_at, DateTime

 end
