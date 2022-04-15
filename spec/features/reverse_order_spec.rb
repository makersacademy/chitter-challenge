feature 'Peeps are seen in reverse chronological order' do
  scenario "See new posts first" do
    Peep.post(peep: "Hey guys! I'm new")
    Peep.post(peep: "Hey New! I'm Michael")
    visit('/peeps')
    expect(page).to have_content("Hey New! I'm Michael Hey guys! I'm new")
  end
end
