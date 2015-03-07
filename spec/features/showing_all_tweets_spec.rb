require 'spec_helper'

feature 'User browses the list of tweets' do

  before(:each) {
    Sheet.create(:text => 'This is a Sheet!') 
    Sheet.create(:text => 'This is also a Sheet!')
  }

  scenario 'when visiting the homepage' do
    visit '/'
    expect(page).to have_content('This is a Sheet!')
  end
  
  scenario 'ordered by time' do
    visit '/'
    page.body.index('This is also a Sheet!').should < page.body.index('This is a Sheet!')
  end

end