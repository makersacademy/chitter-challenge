def fill_in_first
  visit '/newpost'
  fill_in 'title', with: 'First'
  fill_in 'post', with: 'Chittery Do Dah! What a great app!'
  fill_in 'name', with: 'thatdania'
  click_on('Create Post')
end

def fill_in_second
  visit '/newpost'
  fill_in 'title', with: 'Second'
  fill_in 'post', with: 'This program needs more work'
  fill_in 'name', with: 'Theo'
  click_on('Create Post')
end

def sign_up(email: 'thatdania@gmail.com', username: 'thatdania',
   password: 'potatoes', password_confirmation: 'potatoes')
  visit '/newuser'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: email
  fill_in :username, with: username
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end
