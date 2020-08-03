require 'spec_helper'

feature 'Post Peep' do
  scenario 'a user cann add message to form' do
    visit('/peep')
    #  within('form') do
    expect(page).to have_content 'Welcome to Chitter'
  end


  scenario "a user can post a peep to Chitter" do
    visit '/peep/new'
    fill_in "message", :with => 'Chitter'
    click_button('Post')
    expect(page).to have_button?
  end

end
