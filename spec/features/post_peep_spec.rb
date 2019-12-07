feature "Post a new message" do
  scenario "A Maker can post a new message" do
    visit "/peeps/new"
    fill_in "content", with: "First message"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect(page).to have_content "First message"
  end
end
