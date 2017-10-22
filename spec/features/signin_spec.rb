feature "When I sign in" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  scenario "the homepage shows my username" do
    sign_in
    expect(page).to have_content("Welcome, LadyMacker123!")
  end

  scenario "the homepage provides options to Peep and Sign Out" do
    sign_in
    expect(page).not_to have_css("form#sign_in")
    expect(page).not_to have_css("form#sign_up")
    expect(page).not_to have_content("Welcome, Stranger!")
    expect(page).to have_css("form#post_peep")
    expect(page).to have_css("form#sign_out")
  end

  scenario "the PeepDeck isn't shown unless Peeps have been posted" do
    sign_in
    expect(page).not_to have_css("div#peep_deck")
    expect(page).to have_css("div#no_peeps")
  end

end
