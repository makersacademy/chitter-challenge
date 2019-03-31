feature 'Display peeps' do
  scenario 'User sees the posted peeps reverse chronological order' do
    Peep.create(peep: "My first peep")
    Peep.create(peep: "My second peep")

    visit ('/chitter')

    expect(page).to have_content 'My second peep'
    expect(page).to have_content 'My first peep'
  end
end
