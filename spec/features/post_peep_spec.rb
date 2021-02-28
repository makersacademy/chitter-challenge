feature "posting peeps" do
  scenario "user can post a peep" do
    visit "/peeps"
    click_link "Post a Peep"
    fill_in :content, with: "This is my first peep"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect(page).to have_content "List of peeps"
  end
end
