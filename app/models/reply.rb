# Not implemented yet!
class Reply

 include DataMapper::Resource

 property :id, Serial
 property :message, String
 property :date, DateTime, required: true

 belongs_to :peep
 belongs_to :user
end
