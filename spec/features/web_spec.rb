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

def sign_up
  visit '/newuser'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'thatdania@gmail.com'
  fill_in :username, with: 'thatdania'
  fill_in :password, with: 'potatoes'
  click_button 'Sign up'
end
