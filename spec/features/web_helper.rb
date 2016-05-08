
def sign_up(name: 'elia',
  username: 'elia-uk',
  email: 'elia@gmail.com',
  password: 'Obp23',
 password_confirmation: 'Obp23')
  visit('/users/new')
  expect(page.status_code).to eq 200
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button('sign up')
end
