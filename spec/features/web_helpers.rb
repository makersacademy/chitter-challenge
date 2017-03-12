def sign_up(name: 'Santa',
            username: 'santaclaus',
            email: 'santa@northpole.com',
            password: 'rudolph',
            password_confirmation: 'rudolph')
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(username, password)
  visit '/sessions/new'
  p "other sign in"
  p username
  fill_in 'username', with: username
  fill_in 'password', with: password
  click_button 'Sign in'
end
