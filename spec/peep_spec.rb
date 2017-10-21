feature "post a Peep" do
  scenario "I can post a Peep which is displayed on the PeepDeck" do
    visit "/"
    within "form#post_peep" do
      fill_in("message", with: "Example Peep message")
      click_button "Peep"
    end
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content "Example Peep message"
  end
end
