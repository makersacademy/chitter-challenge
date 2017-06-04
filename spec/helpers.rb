def log_in(email = user.email, password = user.password)
  visit '/'
  click_link 'Log In'
  expect(page).to have_content 'Welcome, please sign in here'
  fill_in 'email', with: email
  fill_in 'password', with: password
  click_button 'Log In'
end

def post_peep
  expect(page).to have_content "Post A New Peep"
  peep = 'This is my first peep'
  fill_in 'content', with: peep
  click_button 'Post Peep'
  expect(page).to have_content peep
end

def sign_up(email: 'user@example.com', password: 'secret*123', confirm_password: 'secret*123')
  visit '/'
  expect(page).to have_link "Sign Up"
  click_link 'Sign Up'
  expect(page).to have_content "Please fill in the fields below"
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'checkpassword', with: confirm_password
  click_button 'Sign Up!'
end
