feature "tagging users" do
  before do
    visit '/'
    sign_up_1
    click_button "Sign Out"
    sign_up_2
    click_button "New Peep"
    fill_in("content", with: "Hello, @user1")
    click_button "Submit"
  end
  scenario "tagging user provides link to profile in peep" do
    expect(page).to have_link "@user1"
  end

  scenario "clicking link takes user to profile page for tagged user" do
    click_link "@user1"
    expect(page).to have_content "Mr User"
    expect(page).to have_content "user1@example.com"
  end
end
