feature "Peep creation" do
  scenario "user can post a new peep when logged in" do
    create_user
    log_in
    visit("/peeps/new")
    fill_in(:text, with: "Ed Balls")
    click_button(:Peep)

    expect(current_path).to eq("/peeps")

    within "#timeline" do
      expect(page).to have_content("Ed Balls")
    end
  end

  scenario "user cannot post a new peep when not logged in" do
    visit("/peeps/new")
    fill_in(:text, with: "Ed Balls")
    click_button(:Peep)

    expect(current_path).to eq("/peeps")
    expect(page).to have_content("You must be logged in to do that")
  end
end
