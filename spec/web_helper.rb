def sign_up(email: 'elizabeth@makers.com',
            password: 'password',
            password_confirmation: 'password',
            name: 'Elizabeth',
            username: 'elizard')
  visit '/sign-up'
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  fill_in :name, :with => name
  fill_in :username, :with => username
  click_button 'Sign up'
end

def log_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Log in'
end
