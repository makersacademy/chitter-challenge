def empty_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query("TRUNCATE users, peeps;")
end

def visit_page_and_sign_up
  visit('/')
  click_button('Sign up')
  fill_in('name', with: 'Kim')
  fill_in('username', with: 'kim-morgan')
  fill_in('email', with: 'fake_kim_email@gmail.com')
  fill_in('password', with: 'password123')
  click_button('Sign up')
end
