feature 'User makes a peep' do

  scenario 'when on the homepage' do

    expect(Peep.count).to eq(0)
    visit '/'
    add_peep("I'm having so much fun using Chitter")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.text).to eq("I'm having so much fun using Chitter")
  end

  def add_peep(text)
    within('#new-peep') do
      fill_in 'text', with: text
      click_button 'Add peep'
    end
  end

end