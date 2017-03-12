# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature "sign_in" do
  scenario "user can sign in using username and password"
    visit '/'
    click_button 'Sign in'
    fill_in 'Username', with: "Nat-Nat"
    fill_in 'Password', with: "123456"
    expect(page).to have_content 'Welcome, Natalia!'
end
