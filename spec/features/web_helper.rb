def sign_up
  visit '/sign-up'
  expect(page.status_code).to eq 200

  fill_in :email, with: 'izzy@example.com'
  fill_in :password, with: 'password1'
  fill_in :password_confirmation, with: 'password1'
  fill_in :username, with: 'ilarne'
  click_button 'Sign up'
end

def sign_up_confirmation(email: 'izzy@example.com',
                         password: 'password1',
                         password_confirmation: 'password1')
  visit '/sign-up'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :username, with: 'ilarne'
  click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sign-in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def recover_password
  visit '/recover-password'
  fill_in :email, with: 'izzy@example.com'
  click_button 'Submit'
end
