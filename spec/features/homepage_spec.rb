feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/chitter'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "it provides a signing-in link" do
    visit '/chitter'
    expect(page).to have_link("Sign in here", href: '/chitter/sign-in')
  end

  scenario "it displays all the peeps posted" do
    test_database_setup

    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign up"

    fill_in "content", with: "I am obsessed with this new pizza joint!"
    click_button "Peep peep"

    visit '/chitter'

    expect(page).to have_content "I am obsessed with this new pizza joint!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
