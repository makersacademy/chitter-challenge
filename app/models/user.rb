class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, format: :email_address
  property :password, BCryptHash
  property :name, String
  property :nickname, String
end



# Now let's set up a connection with a database
DataMapper.setup(:default, "postgres://localhost/chitter_test")
# Let's check that everything we wrote in our models was OK
DataMapper.finalize
# And let's build any new columns or tables we added
DataMapper.auto_upgrade!
