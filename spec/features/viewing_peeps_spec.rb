# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
require 'web_helper'

feature 'Viewing peeps' do

  scenario 'I can see all peeps on the peeps page' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello world!'
    click_button 'Create peep'
    visit '/peeps'
    expect(page.status_code).to eq 200
    within 'ul#peeps' do
      expect(page).to have_content('Hello world!')
    end
  end

  scenario 'I want to see peeps in reverse chronological order' do
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'I should be next'
    click_button 'Create peep'
    sign_up
    visit '/peeps/new'
    fill_in 'peep', with: 'I should be first'
    click_button 'Create peep'
    visit '/peeps'
    expect(page.find('li:nth-of-type(1)')).to have_content 'I should be first'
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario 'I want to see the time at which a peep was made' do
    sign_up
    peep = Peep.create(peep: 'Peep', user_id: 1)
    time = peep.created_at # .strftime(fmt='%F %T')
    visit '/peeps'
    expect(page).to have_content time
  end
end
