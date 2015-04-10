# require './spec/spec_helper'

feature 'User adds a new peep' do

  scenario 'when browsing the homepage' do
    expect(Peep.count).to eq 0
    visit '/'
    add_peep 'My first peep'#, 'Sanjay Purswani', 'sanjsanj'
    expect(Peep.count).to eq 1
    # peep = Peep.first
    expect(Peep.first.message).to eq 'My first peep'
    # expect(peep.user_name).to eq 'Sanjay Purswani'
    # expect(peep.user_handle).to eq 'sanjsanj'
  end

  def add_peep message#, user_name, user_handle
    within('#new-peep') do
      fill_in 'message', with: message
      # fill_in 'user_name', with: user_name
      # fill_in 'user_handle', with: user_handle
      click_button 'Peep!'
    end
  end

end
