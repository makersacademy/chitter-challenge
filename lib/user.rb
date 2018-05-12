class User
  include DataMapper::Resource

  property :id,           Serial
  property :user_name,    String
  property :display_name, String
  property :email,        String, :required => true, :unique => true,
    :format   => :email_address,
    :messages => {
      :presence  => "We need your email address.",
      :is_unique => "This email address is already registered",
      :format    => "Not a valid email address"
    }
  property :password,     String
  property :created_at,   DateTime
  property :updated_at,   DateTime

end
