require 'pg'

def create_user
  User.create("Tom", "tom@gmail.com", "TomChitter", "tom2000")
end