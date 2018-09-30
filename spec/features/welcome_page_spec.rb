# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'welcome page' do

  scenario 'welcome message appears' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!!!"
    expect(page).to have_content "Please enter your name and press start to begin"
  end

end
