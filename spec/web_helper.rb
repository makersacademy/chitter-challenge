def fill_test_database
  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("INSERT INTO peeps (id, body, username) VALUES(1, 'I have eaten way too many brownies! Help!', 'loushark');")
end

def sign_up_fill_and_submit
  visit '/'
  click_link 'Sign Up'
  fill_in 'name', with: 'Lou Reade'
  fill_in 'username', with: 'loushark'
  fill_in 'email', with: 'loushark@gmail.com'
  fill_in 'password', with: 'Sharks@reC00l'
  click_button 'sign_up'
end

def login
  visit '/login'
  fill_in 'username', with: 'loushark'
  fill_in 'email', with: 'loushark@gmail.com'
  click_button 'login'
end
