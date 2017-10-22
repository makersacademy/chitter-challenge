feature "When I tag a Peep" do

  let!(:user) do
    User.create(username: "LadyMacker123", email: "ladymacbeth@dunsinane.com", password: "damn3dSp0t")
  end

  scenario "I can filter Peeps by tag" do
    example_peep_1 = "Should I murder King Duncan? #decisionsdecisions #regicide"
    example_peep_2 = "Can anyone recommend a good stain remover? #damnedspot"
    post_peep(example_peep_1)
    post_peep(example_peep_2)
    post_peep("delete this afterwards #regicide")
    expect(page).to have_content(example_peep_1)
    expect(page).to have_content(example_peep_2)
    visit "tags/regicide"
    within "h1#title" do
      expect(page).to have_content("#regicide")
    end
    expect(page).to have_content(example_peep_1)
    expect(page).not_to have_content(example_peep_2)
  end
end
