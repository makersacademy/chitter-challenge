# USER STORY
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do

  scenario 'I can sign up as a new user to Chitter' do
  visit '/'
  click_button :sign_up
  fill_in :name, with: "Jon Snow"
  fill_in :username, with: "kingofthenorth"
  fill_in :email, with: "jon@winterfell.com"
  fill_in :password, with: "winterishere"
  expect(page).to have_content "Welcome, Jon Snow"
  end

  scenario 'I cannot sign up if my username already exists' do

  end

  scenario 'I cannot sign up if my email already exists' do

  end

end
