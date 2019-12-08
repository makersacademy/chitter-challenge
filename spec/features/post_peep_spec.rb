feature "post a peep" do
  scenario "the user can write a peep and it displays on screen" do
    test_database_setup
    sign_up_new_user

    fill_in "content", with: "Hello World!"
    click_button "Peep peep"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
