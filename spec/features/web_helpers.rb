# User.create(username: 'Megatron', email: 'megatron@decepticons.cyb', password: 'optimussucks', password_confirmation: 'optimussucks')

def sign_up(username: 'Megatron', email: 'megatron@decepticons.cyb',
 password: 'optimussucks', password_confirmation: 'optimussucks')

  visit "/users/new"
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end