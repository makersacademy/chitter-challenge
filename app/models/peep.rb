require 'data_mapper'
require 'dm-postgres-adapter'

class Peep
  include DataMapper::Resource

property :id, Serial
property :message, String
property :user, String
property :date, DateTime

def pretty_date
  self.date.strftime("%A, %d %b %Y %l:%M %p")
end

end

