def sign_up(email: 'example@coldmail.com', name: 'George', username: 'Chunks', password: 'password', password_confirmation: 'password')
  visit '/users/new'
  fill_in(:email, with: email)
  fill_in(:name, with: name)
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  fill_in(:password_confirmation, with: password_confirmation)
  click_button 'Sign Up'
end

def sign_in(email: 'example@coldmail.com', password: 'password')
  visit '/sessions/new'
  fill_in(:email, with: email)
  fill_in(:password, with: password)
  click_button 'Sign In'
end
