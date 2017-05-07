def create_account (name: 'Ana Maria Suciu',
                    username: 'ana',
                    email: 'ana@great.com',
                    password: 'apples')
  visit '/users/new'
  fill_in 'name', with: name
  fill_in 'username', with: username
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Create Account'
end
