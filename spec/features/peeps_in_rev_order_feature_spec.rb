require './app/models/peep.rb'
require 'orderly'

RSpec.feature 'peeps are in reverse order' do

  scenario 'I want to see all peeps in reverse chronological order' do
    visit '/'
    fill_in 'peep_body', with: '1'
    click_button 'Peep'
    fill_in 'peep_body', with: '2'
    click_button 'Peep'
    fill_in 'peep_body', with: '3'
    click_button 'Peep'

    save_and_open_page

    within 'ul#peeps' do
    expect('3').to appear_before('2')
    end
  end
end
