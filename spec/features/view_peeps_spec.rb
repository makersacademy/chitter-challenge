feature 'view peeps' do
  scenario 'peeps are displayed to everyone' do
    peep = add_peep(experience:"Backpacking SouthEast Asia")
    visit('/peeps')
    expect(Peep.count).to eq 1
    expect(page).to have_content "Backpacking SouthEast Asia #{peep.created_on.strftime('Posted on %d %B %Y')} #{peep.created_at.strftime("%l:%M %p")}"
  end
end
