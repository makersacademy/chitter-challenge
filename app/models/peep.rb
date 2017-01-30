class Peep
  include DataMapper::Resource

   property :id, Serial
   property :peep_text, String

   has 1, :user, through: Resource

end
