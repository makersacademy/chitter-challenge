def create_user
  user = User.create(name: 'Simona', email: 'simona.gioe88@gmail.com', username: 'Airies', password: 'Password123')
end

def sign_up
  visit '/users/new'
  fill_in('name', with: 'Simona')
  fill_in('username', with: 'Airies')
  fill_in('email', with: 'simona.gioe88@gmail.com')
  fill_in('password', with: 'Password123')
  click_button('Submit')
end

def log_in
  visit '/sessions/new'
  fill_in('email', with: 'simona.gioe88@gmail.com')
  fill_in('password', with: 'Password123')
  click_button('Login')
end

def log_in_with_wrong_email
  visit '/sessions/new'
  fill_in('email', with: 'notherightemail@gmail.com')
  fill_in('password', with: 'Password123')
  click_button('Login')
end

def log_in_with_wrong_password
  visit '/sessions/new'
  fill_in('email', with: 'simona.gioe88@gmail.com')
  fill_in('password', with: 'Nottherightpassword')
  click_button('Login')
end

def post_a_peep
  visit '/peeps/new'
  fill_in('text', with: "First peep text test")
  click_button('Submit')
end
