require 'pg'
require './lib/database.rb'
require './lib/user.rb'

def add_user
  User.add('Testy','Testy McTest','test@test.com','testing123')
end
