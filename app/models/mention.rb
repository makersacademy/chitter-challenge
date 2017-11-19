require 'data_mapper'

class Mention
  include DataMapper::Resource

  belongs_to :peep, key: true
  belongs_to :user, key: true
end
