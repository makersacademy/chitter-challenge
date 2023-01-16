class Peep < ActiveRecord::Base
  belongs_to :user
  # sets up a 1:1 connection with another model - User
  # peeps associated to user via 'user_id' in users table
end