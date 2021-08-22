require 'pg'

def create_user
  User.create("Tom", "tom@gmail.com", "TomChitter", "tom2000")
end

def create_peeps
  Peep.create("Nobody has better respect for intellegence than Donald Trump", "Donald Trump")
  Peep.create("Making a delicious Sunday Roast!", "Toms Mum")
end