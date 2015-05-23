require 'spec_helper'


feature 'User submits a new peep' do 
  scenario 'when browsing the homepage' do 
    expect(Peep.count).to eq(0)
    visit '/peeps/new'
    add_peep('this is a peep')
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq('this is a peep')
  end

  def add_peep(message)
    within('#new-peep') do 
      fill_in 'message', with: message
      click_button 'Add peep'
    end
  end

end