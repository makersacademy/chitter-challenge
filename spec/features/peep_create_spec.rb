feature "Peep creation" do
  let(:peep_text) { PEEPS.first[:text] }
  
  scenario "user can post a new peep when logged in" do
    create_user
    log_in
    visit("/peeps/new")
    fill_in(:text, with: peep_text)
    click_button(:Peep)

    expect(current_path).to eq("/peeps")

    within "#timeline" do
      expect(page).to have_content(peep_text)
    end
  end

  scenario "user cannot post a new peep when not logged in" do
    visit("/peeps/new")
    fill_in(:text, with: peep_text)
    click_button(:Peep)

    expect(current_path).to eq("/peeps")
    expect(page).to have_content("You must be logged in to do that")
  end
end
