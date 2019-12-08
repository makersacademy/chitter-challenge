feature "post a peep" do
  scenario "the user can write a peep and it displays on screen" do
    test_database_setup
    clear_users_table

    visit '/chitter'
    fill_in 'name', with: 'Sipho Adebayo'
    fill_in 'user-handle', with: 'Sips'
    fill_in 'email', with: 'sipho_adebayo@test.com'
    fill_in 'password', with: 'darby34'
    click_button "Sign in"

    fill_in "content", with: "Hello World!"
    click_button "Peep peep"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
