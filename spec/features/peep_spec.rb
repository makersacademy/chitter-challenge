feature "When I post a Peep" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  scenario "I can see it displayed on the PeepDeck" do
    sign_in

    expect { post_peep }.to change(Peep, :count).by(1)

    expect(current_path).to eq "/"
    expect(page.status_code).to eq 200
    expect(page).to have_content "Example Peep message"
  end

  scenario "I can see Peeps displayed on the PeepDeck in reverse chronological order" do

    sign_in

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
