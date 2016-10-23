def sign_up(first_name: 'Tony',
            last_name: 'Stark',
            email: 'tony.stark@starkindustries.com',
            password: 'jarvis',
            password_confirmation: 'jarvis',
            user_name: 'TDawg')
  visit '/users/sign_up'
  expect(page.status_code).to eq(200)
  fill_in :first_name, with: first_name
  fill_in :last_name, with: last_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  fill_in :user_name, with: user_name
  click_button 'Create Account'
end

def log_in(email:, password:)
  visit '/sessions/log_in'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log In'
end
