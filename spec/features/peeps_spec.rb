feature 'peeps' do
  scenario 'are displayed to everyone' do
    time = Time.now.strftime("Posted on %d %B %Y")
    Peep.create(text:"Backpacking SouthEast Asia", created_at: time)
    visit('/peeps')
    expect(Peep.count).to eq 1
    expect(page).to have_content "Backpacking SouthEast Asia #{time}"
  end
end
