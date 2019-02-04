require 'pg'

def populate_test_data
  Peep.add('Test peep')
  Peep.add('Peeping about snow')
  Peep.add('Peep 2')
end

def persisted_data(id)
  connection = PG.connect(dbname: 'chitter_testing')
  connection.query("SELECT * FROM users WHERE id = #{'id'};")
end

def login
  visit '/users/new'
  fill_in 'name', with: "Belinda"
  fill_in 'email', with: "belinda@test.com"
  fill_in 'password', with: "temppassword"
  click_on 'Login'
end
