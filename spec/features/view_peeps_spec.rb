feature "View peeps" do
  scenario "A maker can view the peeps in reverse cronological order" do
    sign_up
    sign_in
    post_peep

    visit "/peeps/new"
    fill_in "content", with: "This is my second peep!"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect("This is my second peep!").to appear_before("This is my first peep!")
  end

  scenario "A maker can view the author's name and username for all the peeps" do
    sign_up
    sign_in
    post_peep

    visit "/peeps"
    expect(page).to have_content "Ben (@BenSE)"
  end
end
