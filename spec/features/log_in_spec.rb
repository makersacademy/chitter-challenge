feature "Signing in" do
  scenario "providing the correct password allows the user to log in" do
    sign_up
    visit("/log_in")
    fill_in 'email', :with => "samuel@gmail.com"
    fill_in 'password', :with => "password"
    click_button('log-in')
    expect(page).to have_content("Welcome to Chitter!")
  end
end
