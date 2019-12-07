feature "View peeps" do
  scenario "A Maker can view the peeps in reverse cronological order" do
    visit "/peeps/new"
    fill_in "content", with: "First peep"
    click_button "Post"

    visit "/peeps/new"
    fill_in "content", with: "Second peep"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect("Second peep").to appear_before("First peep")
  end
end
