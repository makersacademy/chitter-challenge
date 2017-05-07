def sign_up_form_fill
  visit '/home'
  click_button 'Sign Up'
  expect(current_path).to eq '/sign-up'
  fill_in :email, with: 'david@davetherave.com'
  fill_in :name, with: 'David'
  fill_in :username, with: 'DaveTheRave'
  fill_in :password, with: 'goodpassword'
  click_button 'Create Account'
end
