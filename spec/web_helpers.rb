def register
  visit('/')
  fill_in('name', with: 'Dack Jorsey')
  fill_in('username', with: "dack")
  fill_in('email', with: 'dack@chitter.com')
  fill_in('password', with: "password123")
  click_button('Sign up for Chitter')
end

def register_and_sign_in
  visit('/')
  fill_in('name', with: 'Dack Jorsey')
  fill_in('username', with: "dack")
  fill_in('email', with: 'dack@chitter.com')
  fill_in('password', with: "password123")
  click_button('Sign up for Chitter')
  fill_in('username', with: 'dack')
  fill_in('password', with: 'password123')
  click_button('Sign in')
end