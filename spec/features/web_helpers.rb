
def sign_up(name: 'Megatron', username: 'Megatron', email: 'megatron@decepticons.cyb',
 password: 'optimussucks', password_confirmation: 'optimussucks')

  visit "/users/new"
  expect(page.status_code).to eq(200)
  fill_in :name, with: name
  fill_in :username, with: username
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up'
end

def sign_in(username: 'Megatron', password: 'optimussucks')
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign In'
end

def post_message
  visit '/home'
  click_button 'Make a Cheep'
  expect(page.status_code).to eq(200)
  fill_in :msg, with: 'Hello everyone, this is my first "Cheep"!'
  click_button 'Cheep'
end