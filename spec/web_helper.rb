def sign_up(email: 'frodo@hobbiton.com',
            password: 'pr3c10u5',
            password_confirmation: 'pr3c10u5')
  visit '/home'
  click_button 'Sign Up'
  expect(current_path).to eq '/sign-up'
  fill_in :email, with: email
  fill_in :name, with: 'Frodo Baggins'
  fill_in :username, with: 'Ring Bearer'
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Create Account'
end
