class Peep

  include DataMapper::Resource

  property :id,       Serial
  property :content,  String
  #property :poster,    String
  #property :name,    String

end