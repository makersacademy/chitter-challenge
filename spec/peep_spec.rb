feature "Posting a Peep" do
  scenario "I can post a Peep and then see it displayed on the PeepDeck" do
    visit "/"
    within "form#post_peep" do
      fill_in("message", with: "Example Peep message")
      click_button "post"
    end
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content "Example Peep message"
  end

  scenario "I can see Peeps displayed on the PeepDeck in reverse chronological order" do
    visit "/"
    within "form#post_peep" do
      fill_in("message", with: "First Example Peep message")
      click_button "post"
      fill_in("message", with: "Second Example Peep message")
      click_button "post"
    end
    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    within "div#peep_deck" do
      expect(page.find('li:nth-child(1)')).to have_content "Second Example Peep message"
      expect(page.find('li:nth-child(2)')).to have_content "First Example Peep message"
    end
  end
end
