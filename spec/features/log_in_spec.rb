feature "Signing in" do
  scenario "providing the correct password allows the user to log in" do
    sign_up
    visit("/log_in")
    fill_in 'email', :with => "samuel@gmail.com"
    fill_in 'password', :with => "password"
    click_button('log-in')
    expect(page).to have_content("Welcome samuel@gmail.com")
  end

  scenario "must log in with a registered email" do

  end

  scenario "providing the wrong password does not log the user in" do
    sign_up
    visit('log_in')
    visit("/log_in")
    fill_in 'email', :with => "samuel@gmail.com"
    fill_in 'password', :with => "pass"
    click_button('log-in')
    expect(page).to have_content("Incorrect password!")
  end
end
