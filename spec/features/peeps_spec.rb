feature 'peeps' do
  scenario 'are displayed to everyone' do
    time = Time.now
    Peep.create(text:"Backpacking SouthEast Asia", created_at: time)
    visit('/peeps')
    expect(Peep.count).to eq 1
    expect(page).to have_content "Backpacking SouthEast Asia #{time.strftime('Posted on %d %B %Y')} #{time.strftime("%l:%M %p")}"
  end

  # scenario 'are displayed in chronological order' do
  #   time = Time.now
  #   second_time = Time.now
  #   Peep.create(text:"Backpacking SouthEast Asia", created_at: time)
  #   Peep.create(text:"Coast to coast", created_at: second_time)
  #   visit('/peeps')
  #   expect(Peep.count).to eq 2
  #   expect
end
