feature "Logged out welcome screen" do

  scenario "I see a greeting" do
    visit('/')

    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "I see a sign up button" do
    visit('/')

    expect(page).to have_link("Sign Up", href: '/sign_up')
  end

  scenario "I see a log in button" do
    visit('/')

    expect(page).to have_link("Log In", href: '/log_in')
  end

  scenario "I don't see a log out button" do
    visit('/')

    expect(page).not_to have_link("Log Out", href: '/log_out')
  end

end
