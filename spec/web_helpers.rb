def create_account
  visit '/signup'
  fill_in 'name', with: 'Ana Maria Suciu'
  fill_in 'username', with: 'ana'
  fill_in 'password', with: 'apples'
  fill_in 'email', with: 'ana@great.com'
  click_button 'Create Account'
end
