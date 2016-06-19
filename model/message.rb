
class Message
  include DataMapper::Resource
   belongs_to(:user)
   property(:id, Serial)
   property(:message, String, length: 60, required: true)
   property(:timestamp, DateTime, required: true)
end
