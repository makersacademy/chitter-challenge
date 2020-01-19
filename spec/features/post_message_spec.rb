require 'chitter'
require 'database_helpers'

feature 'adding a peep' do 
  scenario 'user can post a peep' do 
    visit('/')
    fill_in :peep_body, with: 'My first peep'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
  end 
end 