require 'peeps'
require 'database_helper'

feature 'show peeps' do
  scenario 'should be able to see all peeps' do
    Peeps.create(peep: 'Test peep 1')
    Peeps.create(peep: 'Test peep 2')
    
    visit '/feed'
    expect(page).to have_content 'Test peep 1'
    expect(page).to have_content 'Test peep 2'
  end

  scenario 'should be able to see peeps with a timestamp' do
    peep = Peeps.create(peep: 'When was this?')
    visit '/feed'
    expect(page).to have_content(peep.created_at)
  end
end