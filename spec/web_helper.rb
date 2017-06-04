def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'john.doe@gmail.com'
  fill_in :full_name, with: 'John Doe'
  fill_in :user_name, with: 'jonny_the_doe'
  fill_in :password, with: 'SecretPassword123'
  fill_in :password_confirmation, with: 'SecretPassword123'
  click_button 'Sign up'
end
