feature 'view peeps' do
  scenario 'peeps are displayed to everyone' do
    time = Time.now
    Peep.create(experience:"Backpacking SouthEast Asia", created_at: time)
    visit('/peeps')
    expect(Peep.count).to eq 1
    expect(page).to have_content "Backpacking SouthEast Asia #{time.strftime('Posted on %d %B %Y')} #{time.strftime("%l:%M %p")}"
  end
end
