def sign_up
  visit '/home'
  click_button 'Sign Up'
  expect(current_path).to eq '/sign-up'
  fill_in :email, with: 'frodo@hobbiton.com'
  fill_in :name, with: 'Frodo Baggins'
  fill_in :username, with: 'Ring Bearer'
  fill_in :password, with: 'pr3c10u5'
  click_button 'Create Account'
end
