# # require 'bcrypt'
#
 class Peep
  include DataMapper::Resource
#
   property :id, Serial
#   property :email, String
#   property :password, String
   property :peep_itself, String
#   property :user_name, String
#
#   #  has n, :peeps, through: Resource
#   # haven't defined that class yet, leave it in
#
end
