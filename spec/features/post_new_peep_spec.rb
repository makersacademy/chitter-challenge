feature "Post a new peep" do
  scenario "A Maker can post a new peep" do
    sign_up
    sign_in
    
    visit "/peeps/new"
    fill_in "content", with: "First peep"
    click_button "Post"

    expect(current_path).to eq "/peeps"
    expect(page).to have_content "First peep"
  end
end
