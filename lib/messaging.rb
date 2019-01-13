require 'data_mapper'


class Messaging
  include DataMapper::Resource

  # handles on messages  
  belongs_to :user,   :key => true
  belongs_to :message, :key => true

end
