require 'spec_helper'

RSpec.feature 'post a peep' do
  scenario 'post a peep to chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'My first peep!')
    click_button('Peep')
    expect(page).to have_content('My first peep!')
  end
end
