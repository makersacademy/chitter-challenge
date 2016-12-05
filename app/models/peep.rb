# This class corresponds to a table in the database
class Peep
  # add DataMapper functionality to this class so it can communicate with the database
include DataMapper::Resource

property :id, Serial
property :message, String

 belongs_to :user

end
