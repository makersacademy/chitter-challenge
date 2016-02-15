require_relative '../data_mapper_setup'

class Peep

 include DataMapper::Resource

 has n, :peeps, through: Resource

 property :id, Serial
 property :message, Text
 property :name, Text
 property :username, Text

end
