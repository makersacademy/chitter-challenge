def sign_up(
            email: 'jollygreengiant@gmail.com',
            password: '2016',
            password_confirmation: '2016',
            name: 'Joe Giant',
            username: 'jollygreengiant')
  visit ('/users/new')
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'name', with: name
  fill_in 'username', with: username
  click_button('Submit')
end

def sign_up_same_username(
            email: 'jgg@gmail.com',
            password: '1234',
            password_confirmation: '1234',
            name: 'John Graham Gardiner',
            username: 'jollygreengiant')
  visit ('/users/new')
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'password_confirmation', with: password_confirmation
  fill_in 'name', with: name
  fill_in 'username', with: username
  click_button('Submit')
end
