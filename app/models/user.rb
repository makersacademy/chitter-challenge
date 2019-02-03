require 'data_mapper'

class User

  include DataMapper::Resource

  DataMapper.setup :default, "postgres://localhost/shitter"

  property :id,         Serial
  property :email,      String, unique: true
  property :username,   String, unique: true, required: true
  property :first_name, String
  property :last_name,  String
  property :password,   String, reader: :protected
#add required: true, and an alert if they don't fill in fields
  validates_format_of   :email, :as => :email_address
  validates_is_unique   :email
  validates_is_unique   :username
  # a call to valid? will return false unless valid

  has n, :peeps


end
