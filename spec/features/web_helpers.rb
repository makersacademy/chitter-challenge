
def sign_up(name: 'Megatron', username: 'best_bot', email: 'megatron@decepticons.cyb',
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

def sign_in(username: 'best_bot', password: 'optimussucks')
  visit '/sessions/new'
  expect(page.status_code).to eq(200)
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign In'
end

def post_message(message: 'Hello everyone, this is my first "Cheep"!')
  visit '/posts/view'
  click_button 'Make a Cheep'
  expect(page.status_code).to eq(200)
  fill_in :msg, with: message
  click_button 'Cheep'
end

def sign_in_and_post(message: 'Hello everyone, this is my first "Cheep"!')
  sign_up
  sign_in
  post_message(message: message)
end