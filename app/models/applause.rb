class Applause
  include DataMapper::Resource
  belongs_to :user, key: true
  belongs_to :cheep, key: true
end