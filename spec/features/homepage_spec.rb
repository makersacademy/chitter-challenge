feature "visit homepage" do
  scenario "it has a welcome message" do
    visit '/'
    expect(page).to have_content "What's on your mind bruh?"
  end

  scenario "it provides a signing-in link" do
    visit '/'
    expect(page).to have_link("LOGIN", href: '/log-in')
  end

  scenario "it displays all the peeps posted" do
    test_database_setup
    sign_up_new_user

    fill_in "content", with: "I am obsessed with this new pizza joint!"
    click_button "DROP SCIENCE"

    visit '/'

    expect(page).to have_content "I am obsessed with this new pizza joint!"
    expect(page).to have_content "Sips"
    expect(page).to have_content "Sipho Adebayo"
  end
end
