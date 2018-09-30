class User
  include DataMapper::Resource
  has n, :messages
end
