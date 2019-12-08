feature "the user can sign up for Chitter" do

  before do
    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign in"
  end

  scenario "their user-handle is displayed once logged in" do
    expect(page).to have_content "Account: Sips"
  end

  scenario "their name and user-handle shows against any peep they post" do
    test_database_setup
    fill_in "content", with: "Hello World!"
    click_button "Peep peep"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
