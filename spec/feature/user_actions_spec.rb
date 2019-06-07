feature "user wants to sign up" do
  scenario "users adds email, password and user name" do
    visit('/')
    click_button"Register"
    fill_in('user', with: 'user@me.com')
    fill_in('pass', with: 'pass123')
    fill_in('name', with: 'Rocky')
    click_button"Sign Me Up"
    expect(page).to have_content("Hello, Rocky")
  end

end