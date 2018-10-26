def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('DROP TABLE IF EXISTS peeps;')
  connection.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140));')
end

def sign_up_as_alice_bobson
  visit '/'
  click_button 'Sign up'
  fill_in :email, with: 'albob@gmail.com'
  fill_in :password, with: 'password123'
  fill_in :name, with: 'Alice Bobson'
  fill_in :username, with: 'albob123'
  click_button 'Submit'
end
