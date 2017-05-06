class User

  include DataMapper::Resource

  property :id, 		Serial
  property :email_address, 	String
  property :password, 		String
  property :user_name, 		String
  property :real_name, 		String

end
