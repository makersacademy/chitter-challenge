feature "User can post a peep message" do
  scenario "By submitting the peep it shows on homepage" do
    visit "/"
    fill_in "new_peep", with: "this is my first peep"
    click_button "Post"
    expect(page).to have_content "this is my first peep"
  end
end
