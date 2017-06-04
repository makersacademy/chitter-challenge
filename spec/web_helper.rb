def sign_up (email: 'john.doe@gmail.com', full_name: 'John Doe', user_name: 'jonny_the_doe', password: 'SecretPassword123', password_confirmation: 'SecretPassword123')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :full_name, with: full_name
  fill_in :user_name, with: user_name
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
