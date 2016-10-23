feature "Creating new posts" do
  scenario "user can create a new post" do
    visit "/posts/new"
    fill_in "message", with: "Blah blah blah"
    click_button "Peep"

    expect(current_path).to eq "/"
    expect(page).to have_content "Blah blah blah"
  end
end
