feature "When I tag a Peep" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  example_peep_1 = "Should I murder King Duncan? #decisionsdecisions #regicide"
  example_peep_2 = "Can anyone recommend a good stain remover? #damnedspot"

  scenario "I can filter Peeps by tag" do
    sign_in
    post_peep(example_peep_1)
    post_peep(example_peep_2)
    expect(page).to have_content(example_peep_1)
    expect(page).to have_content(example_peep_2)
    visit "tags/regicide"
    within "h1#title" do
      expect(page).to have_content("#regicide")
    end
    expect(page).to have_content(example_peep_1)
    expect(page).not_to have_content(example_peep_2)

  end

  scenario "tags appear as clickable links under each Peep" do
    sign_in
    post_peep(example_peep_1)
    within "div#peep_deck" do
      click_link "#regicide"
    end
    expect(current_path).to eq "/tags/regicide"
    expect(page).to have_content(example_peep_1)
  end
end
