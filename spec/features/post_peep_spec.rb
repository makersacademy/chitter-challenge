feature "post a peep" do
  scenario "the user can write a peep and it displays on screen" do
    test_database_setup
    sign_up_new_user

    fill_in "content", with: "Hello World!"
    click_button "DROP SCIENCE"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Sips"
    expect(page).to have_content "Sipho Adebayo"
  end
end
