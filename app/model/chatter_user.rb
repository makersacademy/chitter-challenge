class ChatterUser

  include DataMapper::Resource


  property :id, Serial
  property :name, String
  property :email, String
  property :creation_date, DateTime
  has n, :peeps





end
