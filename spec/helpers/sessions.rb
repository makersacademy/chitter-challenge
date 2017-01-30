module SessionHelpers

def sign_up(email: "test@test.com", password: "password",
  password_confirmation: "password", name: "Test Test", username: "test")
  visit('/users/new')
  fill_in 'user_email', :with => email
  fill_in 'user_password', :with => password
  fill_in 'password_confirmation', :with => password_confirmation
  fill_in 'name', :with => name
  fill_in 'username', :with => username
  click_button 'sign_up'
end

def sign_in(username:, password:)
  visit('/sessions/new')
  fill_in 'username', with: username
  fill_in 'user_password', with: password
  click_button 'sign_in'
end

end
