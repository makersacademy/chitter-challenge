def new_user(username: 'OMGDuke', name: 'Alex',
            email: 'name@email.com', password: '12345',
            password_confirmation: '12345')
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'submit'
end

def sign_in(username: 'OMGDuke', password: '12345')
  visit '/sessions/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign in'
end
