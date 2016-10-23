class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true

end
