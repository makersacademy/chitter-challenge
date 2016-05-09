def sign_up(email: 'bob@ross.com', password: 'bobross', password_confirmation: 'bobross')
  visit '/'
  expect(page.status_code).to eq 200
  click_button 'New Account'
  fill_in :name, with: 'Bob'
  fill_in :username, with: 'bobross'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign me up!'
end

def login(username: 'bobross', password: 'bobross')
  visit '/'
  click_button 'Login'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Login'
end
