def sign_up(email: 'john@doe.com',
            username: 'johndoe',
            password: 'password',
            password_confirmation: 'password')
  visit 'signup'
  expect(page.status_code).to eq 200
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign Up'
end
