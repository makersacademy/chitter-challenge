require 'pg'

feature "Sign in" do

  scenario "asks the user to enter username and password" do
    sign_up
    log_in
    expect(page).to have_content "Hi claude"
  end

  scenario "allows users to sign up" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE users;")
    sign_up
    expect(page).to have_content "Hi claude"
  end

  scenario "prevents log in with incorrect password" do
    visit('/')
    connection = PG.connect(dbname: 'chitter_test')
    User.create_user(username: 'claude', password: 'meow')
    fill_in('username', :with => "claude" )
    fill_in('password', :with => "purr" )
    click_on("submit_1")
    expect(page).to have_content("Invalid password")

  end

  it "logs a user in if the password is correct" do
    connection = PG.connect(dbname: 'chitter_test')
    User.create_user(username: 'claude', password: 'meow')

    log_in
    expect(page).to have_content "c h i t t e r"

  end

  it "tells a user to sign up if user doesn't exist" do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/')
    fill_in("username", :with => "testname")
    fill_in("password", :with => "testpassword")
    click_on("submit_1")
    expect(page).to have_content("No username registered: please sign up")
  end

  it "prevents a user from choosing an existing username" do
    sign_up
    sign_up
    expect(page).to have_content("Username is unavailable - please choose another")
  end

end
