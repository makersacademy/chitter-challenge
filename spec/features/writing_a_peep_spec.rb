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
    fill_in 'peep', with: 'My very first peep.'
    click_button 'Peep'

    expect(page).not_to have_content('User: j.smith90')
    expect(page).not_to have_content('My very first peep')
    expect(page).to have_content('You have to sign in to leave a Peep!')
  end

  # scenario 'writing a peep that is too long' do
  #   sign_up
  #   super_long_peep
  #
  #   expect(page).to have_content('You have been peeping for too long, please control yourself to 150 characters!')
  # end

end
