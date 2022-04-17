require 'spec_helper'

feature 'add a peep' do
  scenario 'a user can post a new peep' do
    visit '/peeps/new'
    fill_in 'peep', with: 'Hello!'
    fill_in 'user', with: 'Mon'
    click_button 'Post peep'

    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Hello!')
    end
end