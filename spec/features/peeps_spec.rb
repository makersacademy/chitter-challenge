feature 'peeps' do
  scenario 'are displayed to everyone' do
    Peep.create(text:"Backpacking SouthEast Asia")
    visit('/peeps')
    expect(Peep.count).to eq 1
    expect(page).to have_content "Backpacking SouthEast Asia"
  end
end
