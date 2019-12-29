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

  # scenario "the user can edit their peep after it's been posted" do
  #   expect(page).to have_link "Edit"
  #
  #   click_link "Edit"
  #   fill_in "content", with: "Hello Universe!"
  #   click_button "TRIUMPHANT"
  #
  #   expect(current_path).to eq "/user"
  #   expect(page).to have_content "Changes made"
  #   expect(current_path).to eq "/user"
  #   expect(page).not_to have_content "Hello World!"
  #   expect(page).to have_content "Hello Universe!"
  # end

  # scenario "the user can like peeps they enjoyed" do
  #   expect(page).to have_button "Like"
  # end
end
