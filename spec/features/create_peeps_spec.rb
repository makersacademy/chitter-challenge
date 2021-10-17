feature "creating peeps" do
  scenario "creates and displays a peep" do
    visit ("/home")
    click_link "Post a peep"
    fill_in "body", with: "New page whu dis"
    click_button "Submit"

    expect(page).to have_content "New page whu dis"
  end
end
