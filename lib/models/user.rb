class User
  include DataMapper::Resource

  property :id, Serial
  property :display_name, String, required: true
  property :email, String, format: :email_address, unique: true, required: true
  property :pass_hash, String, length: 60, required: true

  has n, :peeps
end
