require 'pg'

feature "Sign in" do

  scenario "it asks the user to enter username and password" do
    log_in
    expect(page).to have_content "Hi claude"
  end

  scenario "it allows users to sign up" do
    sign_up
    expect(page).to have_content "Hi claude"
  end

  scenario "prevents log in with incorrect password" do
    visit('/')
    connection = PG.connect(dbname: 'chitter_test')
    user = User.create_user(username: 'claude', password: 'meow', email: 'petar@simonovic.com')
    fill_in('username', :with => "claude" )
    fill_in('password', :with => "purr" )
    click_on("submit_1")
    # expect(page).to have_content("Invalid password")
  end

end
