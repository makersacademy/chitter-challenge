def sign_up(email:'alice@example.com', password:'oranges!', password_confirmation:'oranges!', username:'nyancat', name:'Alice Wonder')
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: email
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_in(email:'alice@example.com', password:'oranges!')
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

def create_post(post:"Hello world!")
  sign_up
  sign_in
  click_button 'New'
  fill_in :post, with: post
  click_button 'Create Post'
end
