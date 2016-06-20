def signup(email: 'johndoe@gmail.com',
		   name: 'John Doe',
		   username: 'johndoe',
           password: '12345678',
           password_confirmation: '12345678')

  visit('users/new')
  fill_in :email, :with => email
  fill_in :name, :with => name
  fill_in :username, :with => username
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button('Sign up')
end

def signin(email: 'johndoe@gmail.com',
	       password: '12345678')
  visit('sessions/new')
  fill_in :email, :with => email
  fill_in :password, :with => password
  click_button('Sign in')
end