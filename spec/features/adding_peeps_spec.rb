feature 'User adds a new peep' do
  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq(0)
    visit '/'
    add_peep('peep peep!')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.content).to eq('peep peep!')
  end

  def add_peep(message)
    within('#new-peep') do
      fill_in 'content', with: message
      click_button 'Add peep'
    end
  end
end
