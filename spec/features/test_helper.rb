def create_account
  visit '/create_account'
  fill_in 'name', with: "Hannah"
  fill_in 'password', with: "password123"
  fill_in 'email', with: "test@gmail.com"
  click_button 'Create Account'
end
