require 'spec_helper'

RSpec.feature 'writing a new peep' do

  scenario 'logged in user can write a peep' do
    sign_up
    fill_in 'peep', with: 'My very first peep.'
    click_button 'Peep'

    expect(page).to have_content('User: j.smith90')
    expect(page).to have_content('My very first peep')
  end

  scenario 'non logged in user can\'t write a peep' do
    sign_up
    click_button 'Sign out'

    expect(page).not_to have_content('User: j.smith90')
    expect(page).not_to have_button('Peep')
    # expect(page).to have_content('You have to sign in to leave a Peep!')
  end


end
