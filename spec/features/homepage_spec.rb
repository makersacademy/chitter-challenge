feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/chitter'
    expect(page).to have_content "Chitty Chitty Bang Bang!"
  end

  scenario "it displays all the peeps posted" do
    test_database_setup
    clear_users_table

    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign in"

    fill_in "content", with: "I am obsessed with this new pizza joint!"
    click_button "Peep peep"

    visit '/chitter'

    expect(page).to have_content "I am obsessed with this new pizza joint!"
  end
end
