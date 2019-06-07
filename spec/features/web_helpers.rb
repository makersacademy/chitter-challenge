def post_peep(peep)
  visit 'peeps/new'
  fill_in 'post', with: peep
  click_button 'Submit'
end

def sign_up
  visit 'users/new'
  allow(ChitterMailer).to receive(:call).and_return(nil)
  fill_in 'email_address', with: '123@test.com'
  fill_in 'username', with: '123test'
  fill_in 'name', with: '123 Test'
  fill_in 'password', with: '123test'
  fill_in 'password_confirmation', with: '123test'
  click_button 'sign-up'
end

def sign_up_incorrect_password_verification
  visit 'users/new'
  fill_in 'email_address', with: '234@test.com'
  fill_in 'username', with: '234test'
  fill_in 'name', with: '234 Test'
  fill_in 'password', with: '123test'
  fill_in 'password_confirmation', with: '234test'
  click_button 'sign-up'
end

def sign_up_blank_email
  visit 'users/new'
  fill_in 'username', with: '123test'
  fill_in 'name', with: '123 Test'
  fill_in 'password', with: '123test'
  fill_in 'password_confirmation', with: '123test'
  click_button 'sign-up'
end

def sign_up_blank_username
  visit 'users/new'
  fill_in 'email_address', with: '234@test.com'
  fill_in 'name', with: '123 Test'
  fill_in 'password', with: '123test'
  fill_in 'password_confirmation', with: '123test'
  click_button 'sign-up'
end

def sign_up_blank_name
  visit 'users/new'
  fill_in 'username', with: '123test'
  fill_in 'email_address', with: '234@test.com'
  fill_in 'password', with: '123test'
  fill_in 'password_confirmation', with: '123test'
  click_button 'sign-up'
end

def sign_in(email:, password:)
  visit 'sessions/new'
  fill_in :email_address, with: email
  fill_in :password, with: password
  click_button 'Login'
end
