feature "View peeps" do
  scenario "A Maker can view the peeps in reverse cronological order" do
    visit "/peeps/new"
    fill_in "content", with: "First message"
    click_button "Post"

    visit "/peeps/new"
    fill_in "content", with: "Second message"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect("Second message").to appear_before("First message")
  end
end
