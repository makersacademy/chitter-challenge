require 'spec_helper'

feature 'Creating peeps' do

  scenario 'user can create a new peep' do
    visit '/peeps/new'
    fill_in :content, with: 'Asi es el calor'
    click_button 'Post'

    expect(current_path).to eq '/peeps'
    expect(page).to have_content('Asi es el calor')

  end
end