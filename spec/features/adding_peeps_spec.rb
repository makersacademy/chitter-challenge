require 'spec_helper'

feature 'Feature - Peeps Database' do
  peep = Peep.first

  scenario 'Peep can be added to the database' do
    expect(Peep.count).to eq 0
    visit '/'
    add_peep 'My first peep'#, 'Sanjay Purswani', 'sanjsanj'
    expect(Peep.count).to eq 1
    expect(peep.message).to eq 'My first peep'
    expect(peep.user_name).to eq 'Sanjay Purswani'
    expect(peep.user_handle).to eq 'sanjsanj'
  end

  def add_peep message#, user_name, user_handle
    within('#new-peep') do
      fill_in 'message', with: message
      fill_in 'user_name', with: user_name
      fill_in 'user_handle', with: user_handle
      click_button 'Peep!'
    end
  end

end
