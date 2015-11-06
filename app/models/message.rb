require_relative '../data_mapper_setup'

class Message
  include DataMapper::Resource

    property :id, Serial
    property :message, String
end
