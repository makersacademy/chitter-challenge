def sign_up(full_name: 'Tim', user_name: 'TC86', email: 'tim@gmail.com', password: 'kiwi', password_confirmation: 'kiwi')
  visit '/user/new'
  fill_in :full_name, with: full_name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
