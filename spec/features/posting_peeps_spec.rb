feature 'posting peeps' do
  scenario 'users can post peeps' do
    visit '/peep/new'
    fill_in :peep, with: "My life is sooooo interesting"
    click_button 'peep'
    within "ul#peeps" do
      expect(page).to have_content "My life is sooooo interesting"
    end
  end

  xscenario "if not signed in can't post peep" do
    visit '/peep/new'
    fill_in :peep, with: "Look at my dinner...."
    click_button 'peep'
    expect(page).not_to have_content "Look at my dinner...."
    expect(page).to have_content "Please sign in to post peeps"
  end

  xscenario "max peep length of 144 chars" do
  end
end
