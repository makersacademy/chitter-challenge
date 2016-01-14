class Chit
  include DataMapper::Resource

  property :id, Serial
  property :chit_text, Text
  property :chit_time, String

  # belongs_to :user
end
