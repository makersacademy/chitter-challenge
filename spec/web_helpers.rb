def sign_in
  visit '/users/new'
  fill_in 'username', with: 'SexyClownfish'
  fill_in 'email', with: 'mike@aol.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Create new user'
end

def different_passwords
  visit '/users/new'
  fill_in 'username', with: 'Superhot'
  fill_in 'email', with: 'modern@aol.com'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password2222'
  click_button 'Create new user'
end

def requires_email
  visit 'users/new'
  fill_in 'username', with: 'SexyPokemon'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Create new user'
end

def invalid_email_format
  visit 'users/new'
  fill_in 'username', with: 'SexyWarrior'
  fill_in 'email', with: 'abc'
  fill_in 'password', with: 'password'
  fill_in 'password_confirmation', with: 'password'
  click_button 'Create new user'
end
