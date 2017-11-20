def sign_up(username, email)
  visit '/users/new'
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('name', with: 'Timothy Hopkins')
  fill_in('password', with: '12345')
  fill_in('password_confirmation', with: '12345')
  click_button('Sign up!')
end

def sign_up_password_mismatch
  visit '/users/new'
  fill_in('username', with: 'timmy')
  fill_in('email', with: 'timmy@hello.com')
  fill_in('name', with: 'Timothy Hopkins')
  fill_in('password', with: '12345')
  fill_in('password_confirmation', with: 'abcdefg')
  click_button('Sign up!')
end

def login(password)
  visit '/sessions/new'
  fill_in('username', with: 'timmy')
  fill_in('password', with: password)
  click_button('Login')
end

def post_peep(peep)
  visit '/peeps'
  fill_in('peep', with: peep)
  click_button('Peep!')
end

def recover_password
  visit '/users/recover'
  fill_in :email, with: "timmy@hello.com"
  click_button "Submit"
end

def reset_password(password, confirmation)
  visit("/users/reset_password?token=#{User.first.password_token}")
  fill_in :password, with: password
  fill_in :password_confirmation, with: confirmation
  click_button "Submit"
end
