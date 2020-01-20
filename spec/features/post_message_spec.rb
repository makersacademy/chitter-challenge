require 'chitter'
require 'database_helpers'

feature 'adding a peep' do 
  scenario 'user can post a peep' do 
    visit('/')
    fill_in :peep_body, with: 'My first peep'
    fill_in :peep_name, with: 'Ben'
    fill_in :peep_handle, with: 'squareben'
    click_button 'Post'
    expect(page).to have_content 'My first peep'
    expect(page).to have_content 'Ben'
    expect(page).to have_content 'squareben'
  end 

  scenario 'peeps have TIME posted' do 
    visit('/')
    fill_in :peep_body, with: 'My first peep'
    fill_in :peep_name, with: 'Ben'
    fill_in :peep_handle, with: 'squareben'
    click_button 'Post'
    expect(page).to have_content "#{Time.now.round}"
  end 
end 