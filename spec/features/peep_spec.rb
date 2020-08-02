require 'spec_helper'

feature 'Post Peep' do
  scenario 'a user cann add message to form' do
    visit('/peep')
    #  within('form') do
    expect(page).to have_content 'Welcome to Chitter'
  end

end
