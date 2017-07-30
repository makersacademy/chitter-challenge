# USER STORY
# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up' do

  scenario 'I can sign up as a new user to Chitter' do
    sign_up
    expect(page).to have_content "Welcome, Jon Snow"
  end

  scenario 'I cannot sign up if my username already exists' do
    sign_up_duplicate_username
    expect(page).to have_content "Username is already taken"
  end

  scenario 'I cannot sign up if my email already exists' do
    sign_up_duplicate_email
    expect(page).to have_content "Email is already taken"
  end

end
