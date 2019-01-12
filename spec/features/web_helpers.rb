def sign_up
  visit '/users/sign_up'
  fill_in :user_email, with: 'test@test.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Sign up'
end

def post_peep
  visit '/peeps/new'
  fill_in :peep_title, with: 'First peep'
  fill_in :peep_body, with: 'I love summer!'
  click_button 'Save Peep'
end
