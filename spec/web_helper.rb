def sign_up
  visit '/home'
  click_button 'Sign Up'
  expect(current_path).to eq '/sign-up'
  fill_in :email, with: 'david@makersacademy.com'
  fill_in :name, with: 'David'
  fill_in :username, with: 'DaveTheRave'
  fill_in :password, with: 'bootsncats'
  click_button 'Sign Up'
end
