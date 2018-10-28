feature "Logged out welcome screen" do

  scenario "I see a welcome page with a greeting" do
    visit('/')

    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "I see a welcome page with a sign up button" do
    visit('/')

    expect(page).to have_link("Sign Up", href: '/sign_up')
  end

  scenario "I see a welcome page with a log in button" do
    visit('/')
    
    expect(page).to have_link("Log In", href: '/log_in')
  end

end
