require 'spec_helper'

feature 'Viewing peeps' do 
  scenario 'peeps are displayed on the page' do
    Peep.create(message: 'This is test Peep #1')
    Peep.create(message: 'This is test Peep #2')
    visit '/peeps'
    expect(page).to have_content('This is test Peep #1')
    expect(page).to have_content('This is test Peep #2')
  end
end
