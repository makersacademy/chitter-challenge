class User
   include DataMapper::Resource

   property :id,               Serial
   property :user_name,        String
   property :user_email,       String

end
