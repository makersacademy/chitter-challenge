def log_in
  visit '/'
  click_link 'Log In'
  expect(page).to have_content 'Welcome, please sign in here'
  fill_in 'email', with: user.email
  fill_in 'password', with: user.password
  click_button 'Log In'
end

def post_peep
  expect(page).to have_content "Post A New Peep"
  peep = 'This is my first peep'
  fill_in 'content', with: peep
  click_button 'Post Peep'
  expect(page).to have_content peep
end
