class User
  include DataMapper::Resource
  
  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :email, String,
           required: true, unique: true,
           format: :email_address,
           messages: {
             presence: 'We need your email address.',
             is_unique: 'We already have that email.',
             format: 'Not a valid email address'
           }
  property :password, BCryptHash, required: true
end
