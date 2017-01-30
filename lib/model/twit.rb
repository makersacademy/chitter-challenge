# simple datamapper model class
class Twit
  include DataMapper::Resource
  property :id, Serial,
           required: true
  property :content, String,
           length: 140,
           required: true
  property :time_stamp, DateTime,
           required: true

  belongs_to :user
end
