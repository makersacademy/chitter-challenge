feature "the user can log out of Chitter" do

  before do
    test_database_setup
    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign up"
  end

  scenario "there is a link to log out" do
    expect(page).to have_link("Log out", href: "/chitter/log-out")
  end

  scenario "they can press the link and log out" do
    click_link "Log out here"
    expect(page).to have_content "You are logged out!"
  end
end
