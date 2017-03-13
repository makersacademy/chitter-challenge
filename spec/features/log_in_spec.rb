# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "log in" do
  scenario "User logs in with personal information" do
    visit '/'
    fill_in 'Username', with: ('Azntastic')
    fill_in 'Email', with: ('Ryanchu.ws@gmail.com')
    fill_in 'Password', with: ('ryanchu1234')
    click_button "Submit"
    expect(page).to have_content "Welcome, Azntastic"
  end
end
