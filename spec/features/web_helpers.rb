def sign_up_and_log_in

  User.create(email: 'sean@bean.com', name: 'Sean Bean', password: 'Yorkshire', username: 'Sean')
  visit '/homepage'
  expect(page).to have_content("Welcome to Chitter")
  expect(page).to have_selector(:link_or_button, 'Sign In')
  click_button('Sign In')

  expect(current_path).to eq '/homepage/sign_in'
  fill_in('username', with: 'Sean')
  fill_in('password', with: 'Yorkshire')
  click_button('Sign In')

end
