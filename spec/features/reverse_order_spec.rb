feature 'Peeps are seen in reverse chronological order' do
  scenario "See new posts first" do
    Peep.post(peep: "Hey guys! I'm new")
    Peep.post(peep: "Hey New! I'm Michael")
    that = "Hey guys! I'm new"
    this = "Hey New! I'm Michael"
    visit('/peeps')
    expect(this).to appear_before(that)
  end
end
