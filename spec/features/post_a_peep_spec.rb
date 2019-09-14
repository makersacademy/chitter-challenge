require 'spec_helper'
require './app'

feature 'post a peep' do
  scenario 'user can post a new peep' do
    visit '/'
    click_button 'new peep'

    fill_in 'peep', with: 'Hello peeps, this is my first peep!'
    click_button 'send peep'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello peeps, this is my first peep!'
  end
end
