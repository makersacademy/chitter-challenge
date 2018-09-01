feature "Index page has links to other page(s)" do
  scenario "User can navigate to add new post" do
    visit("/")
    click_link "write_message"
    expect(page).to have_field "message"
    expect(page).to have_field "username"
    expect(page).to have_field "handle"
    expect(page).to have_button "Save"
  end
end
