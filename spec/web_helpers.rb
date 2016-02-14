def sign_up(name: 'Michael Collins',
            email: 'michael@email.com',
            username: 'mjcollins86',
            password: 'p4ssw0rd',
            password_confirmation: 'p4ssw0rd')
  visit '/signup'
  fill_in 'name', with: name
  fill_in 'email', with: email
  fill_in 'username', with: username
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email, password)
  visit '/sessions/new'

  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Sign in'
end
