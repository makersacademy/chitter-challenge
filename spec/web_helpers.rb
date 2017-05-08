
def create_account
  visit '/users/new'
  fill_in 'name', with: 'Ana Maria'
  fill_in 'username', with: 'ana'
  fill_in 'email', with: 'ana@great.com'
  fill_in 'password', with: 'apples'
  click_button 'Create Account'
end
