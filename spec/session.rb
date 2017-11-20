module SessionHelpers

def sign_up(email: 'thatdania@gmail.com', username: 'thatdania',
   password: 'potatoes', password_confirmation: 'potatoes')
  visit '/newuser'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email: 'thatdania@gmail.com', password: 'potatoes')
  visit '/login'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

end 
