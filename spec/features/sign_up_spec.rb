# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign up for Chitter' do
  before do
    visit '/'
  end

  scenario 'Can enter name, username, email, password, and submit' do
    expect(page).to have_content "Welcome to Chitter!"
    fill_in "name", with: "Caitlin"
    fill_in "username", with: "Caitlincooling"
    fill_in "email", with: "Caitlin@test.com"
    fill_in "password", with: "caitlin123"
    click_button "Submit"
    expect(page).to have_content "Hi Caitlin"
  end
end
