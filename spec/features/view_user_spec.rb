feature "viewing user page" do
  before do
    visit '/'
    sign_up_1
    click_button "View Profile"
  end

  scenario "see page with user details" do
    expect(page).to have_content "user1"
    expect(page).to have_content "Mr User"
  end

end
