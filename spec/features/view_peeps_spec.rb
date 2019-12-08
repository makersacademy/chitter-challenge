feature "View peeps" do
  scenario "A maker can view the peeps in reverse cronological order" do
    post_peep

    visit "/peeps/new"
    fill_in "content", with: "Second peep"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect("Second peep").to appear_before("First peep")
  end

  scenario "A maker can view the author's name and username for all the peeps" do
    sign_up
    sign_in
    post_peep

    visit "/peeps"
    expect(page).to have_content "by Andrea (@Angea89)"
  end
end
