feature 'Shows the homepage' do
  scenario 'welcomes users' do
    visit ('/homepage')
    expect(page).to have_content("Welcome to Chitter")
    expect(page).to have_selector(:link_or_button, 'Sign Up')
  end
end

feature "User sign up" do
  scenario "it allows a user to sin up for chitter" do
    visit ('/homepage/sign_up')
    fill_in("email", with:"sean@gmail.com")
    fill_in("username", with:"Sean")
    click_button("Sign Up")

    expect(page).to have_content("Hello Sean welcome to Chitter")
  end
end
