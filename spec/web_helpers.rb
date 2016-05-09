def sign_up(username: 'pija23', email: 'piet@somewhere.com', password_confirmation: 'g3he1m')
  visit '/'
  click_button 'Sign up'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :password, with: 'g3he1m'
  fill_in :password_confirmation, with: password_confirmation
  fill_in :name,     with: 'Piet Jansen'
  fill_in :username, with: username
  click_button 'Sign up'
end


def create_user
  user = User.create(name: 'Piet Jansen',
                     email: 'piet@somewhere.com',
                     username: 'pija23',
                     password: 'g3he1m',
                     password_confirmation: 'g3he1m')
end

def login
  visit '/'
  click_button 'Login'
  expect(page.status_code).to eq(200)
  fill_in :username, with: 'pija23'
  fill_in :password, with: 'g3he1m'
  click_button 'Log in'
end
