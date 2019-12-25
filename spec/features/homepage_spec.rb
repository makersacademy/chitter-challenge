feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "it provides a signing-in link" do
    visit '/'
    expect(page).to have_link("Log In", href: '/log-in')
  end

  scenario "it displays all the peeps posted" do
    test_database_setup
    sign_up_new_user

    fill_in "content", with: "I am obsessed with this new pizza joint!"
    click_button "Drop Science"

    visit '/'

    expect(page).to have_content "I am obsessed with this new pizza joint!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
