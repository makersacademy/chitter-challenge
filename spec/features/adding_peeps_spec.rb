feature 'User adds a new peep' do

  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep('Look at my breakfast, lolz')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq('Look at my breakfast, lolz')
  end

  def add_peep(text)
    within('#new-peep') do
      fill_in 'text', with: text
      click_button 'Peep!'
    end
  end

end