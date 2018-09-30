def setup_test_database
  connection = PG.connect dbname: 'chitter_test'
  connection.exec 'TRUNCATE peeps, users'
end

def sign_up_and_go_to_homepage
  visit '/'
  click_link 'Sign Up'
  fill_in('name', with: 'Test Name')
  fill_in('username', with: 'Test')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end
