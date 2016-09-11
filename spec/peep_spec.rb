require 'spec_helper'
require 'web_helper'

feature 'peep' do
  scenario 'can post a peep' do
    sign_up
    fill_in(:peep, with: 'test peep')
    click_button 'peep!'
    expect(page).to have_content 'test peep'
  end

  scenario 'shows name' do
    sign_up
    fill_in(:peep, with: 'test peep')
    click_button 'peep!'
    expect(page).to have_content 'New User wrote:'
  end
end
