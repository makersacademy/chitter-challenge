def sign_up
  visit '/'
  fill_in :name, with: "Harry Potter"
  fill_in :user_name, with: "Scarface"
  fill_in :email, with: "hpotter@gmail.com"
  fill_in :password, with: "Password123"
  click_button 'Sign up'
end

def user_id
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("INSERT INTO users (name, username, email, password) VALUES ('Harry Potter', 'Scarface', 
        'hpotter@gmail.com', 'Password123');")

  result = connection.exec('SELECT id FROM users') 
  result[0]['id']
end
