feature "Logged in welcome screen" do

  scenario "I see a welcome page with a greeting" do
    sign_up

    expect(page).not_to have_content "Welcome to Chitter!"
  end

  scenario "I don't see a sign up button" do
    sign_up

    visit('/')

    expect(page).not_to have_link("Sign Up", href: '/sign_up')
  end

  scenario "I don't see a log in button" do
    sign_up

    visit('/')

    expect(page).not_to have_link("Log In", href: '/log_in')
  end

end
