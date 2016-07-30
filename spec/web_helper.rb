def sign_up(username: 'nomi811',
            name: 'Nomi Vos',
            email: 'nomi@example.com',
            password: 'password',
            confirm_password: 'password')
  visit '/users/new'
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :confirm_password, with: confirm_password
  click_button 'Sign up'
end

def sign_in(username:, password:)
visit '/sessions/new'
fill_in :username, with: username
fill_in :password, with: password
click_button 'Sign in'
end
