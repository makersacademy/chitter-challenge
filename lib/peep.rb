require 'data_mapper'
require 'pg'

class Peep
    attr_reader :name, :user_name, :text, :time 

    include DataMapper::Resource
    property :id, Serial  
    property :user_name, String
    property :text, String
    property :time, Timestamp

end