feature "signing up" do
  scenario "is taken to welcome page after signing up" do
    sign_up
    expect(page).to have_content("Welcome, macebake!")
  end
end

feature "logging in" do
  scenario "expect welcome page to have log in form if not logged in" do
    visit('/')
    click_button('Log in')
    expect(page).to have_content("Already have an account? Log in!")
  end

  scenario "expect welcome page not to have log in or sign up buttons if logged in" do
    log_in
    visit('/')
    expect(page).not_to have_content("Log in")
    expect(page).not_to have_content("Sign up")
  end

  scenario "greets user by username after login" do
    log_in
    expect(page).to have_content("Welcome, macebake!")
  end
end

feature "logging out" do
  scenario ""
end
