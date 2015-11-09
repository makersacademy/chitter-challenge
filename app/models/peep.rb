class Peep
  include DataMapper::Resource

  property :id,   Serial
  property :peep, String, :length => 0..20, :messages => { :length => 'Your peep can only be 20 characters long'} 

end
