feature "post a peep" do

  before do
    test_database_setup
    sign_up_new_user

    fill_in "content", with: "Hello World!"
    click_button "DROP SCIENCE"
  end

  scenario "the user can write a peep and it displays on screen" do
    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Sips"
    expect(page).to have_content "Sipho Adebayo"
  end

  scenario "the user can delete their peep after it's been posted" do
    expect(page).to have_button "Delete"

    click_button "Delete"

    expect(current_path).to eq "/user"
    expect(page).not_to have_content "Hello World!"
  end

  scenario "the user can edit their peep after it's been posted" do
    expect(page).to have_button "Edit"

    click_button "Edit"
    fill_in "content", with: "Hello Universe!"
    click_button "TRIUMPHANT"

    expect(current_path).to eq "/user"
    expect(page).not_to have_content "Hello World!"
    expect(page).to have_content "Hello Universe!"
  end

end
