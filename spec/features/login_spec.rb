feature "logging in" do
  before do
    sign_up
    logout
  end

  scenario "navigate to login page" do
    visit("/sessions/new")
    expect(page).to have_content "Please enter your details to login"
  end

  scenario "sign in with correct credentials" do
    login
    expect(page).to have_content "Hello Amy!"
  end

  scenario "sign in with incorrect password" do
    login(email: "amy@gmail.com", password: "wrong_password")
    expect(page).to have_content "Incorrect email and password combination"
  end

  scenario "sign in with unrecognised email address" do
    login(email: "unregistered@gmail.com", password: "my_password")
    expect(page).to have_content "Incorrect email and password combination"
  end
end
