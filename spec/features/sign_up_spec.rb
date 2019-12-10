feature "the user can sign up for Chitter" do

  before do
    test_database_setup
    sign_up_new_user
  end

  scenario "their user-handle is displayed once logged in" do
    expect(page).to have_content "Account: Sips"
  end

  scenario "their name and user-handle shows against any peep they post" do
    fill_in "content", with: "Hello World!"
    click_button "Peep peep"

    expect(page).to have_content "Hello World!"
    expect(page).to have_content "Posted by: Sips (Sipho Adebayo)"
    expect(page).to have_content "Posted on: "
  end
end
