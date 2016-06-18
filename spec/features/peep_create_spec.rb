feature "Peep creation" do
  scenario "user can post a new peep when logged in" do
    create_user
    # log_in
    visit("/peeps/new")
    fill_in(:peep, with: "Ed Balls")
    click_button(:Peep)

    expect(current_path).to eq("/peeps")

    within "#timeline" do
      expect(page).to have_content("Ed Balls")
    end
  end
end
