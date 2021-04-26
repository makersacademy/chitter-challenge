require 'pg'
require 'orderly'
require 'spec_helper'

feature 'posting to chitter' do
  scenario 'user can post a peep to chitter' do
    visit '/'
    fill_in 'peep', with: 'Loving life #brunch' 
    click_button 'Peep'

    expect(page).to have_content 'Loving life #brunch'
  end
end

feature 'peeps appear in reverse chronological order' do 
  scenario 'user sees peeps in reverse chronological order' do 
    visit '/'
    fill_in 'peep', with: 'Natures beauty #sunset #beach'
    click_button 'Peep'
    visit '/'
    fill_in 'peep', with: 'Too dark to find towel'
    click_button 'Peep'

    expect(page.find('li:nth-child(1)')).to have_content 'Too dark to find towel'
    expect(page.find('li:nth-child(2)')).to have_content 'Natures beauty #sunset #beach'

  end
end

feature 'peeps and time appear together' do 
  scenario 'user sees peeps the time they were posted' do 
    visit '/'
    fill_in 'peep', with: 'Early mornings #healthylifestyle'
    click_button 'Peep'

    expect(page).to have_content 'Early mornings #healthylifestyle'
    expect(page).to have_content "#{Time.now.strftime("%I:%M")}"
  end
end
