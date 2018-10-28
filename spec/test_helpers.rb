def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('DROP TABLE IF EXISTS peeps;')
  connection.exec('DROP TABLE IF EXISTS users;')
  connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY, " \
    "email VARCHAR(100), password VARCHAR(60), name VARCHAR(50), " \
    "username VARCHAR(20));")
  connection.exec(
    "CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(140), " \
    "time VARCHAR(20), user_id INTEGER REFERENCES users(id) ON DELETE CASCADE);")
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

def log_in_as_alice_bobson
  visit '/'
  fill_in :email, with: 'albob123@gmail.com'
  fill_in :password, with: 'password123'
  click_button 'Log in'
end

def add_peeps_to_test_database
  add_users_to_test_database
  Peep.create('My first peep', '1')
  Peep.create('My second peep', '1')
  Peep.create('My third peep', '2')
end

def add_users_to_test_database
  User.create(email: 'albob123@gmail.com', password: 'password123',
    name: 'Alice Bobson', username: 'albob123')
  User.create(email: 'bobal321@gmail.com', password: 'password321',
    name: 'Bob Alson', username: 'bobal321')
end
