require 'spec_helper'

feature 'post a peep' do
    scenario 'allows user to post a peep' do
        visit '/homepage'
        fill_in 'statusbox', with: 'Peep peep!'
        click_button 'Peep!'
        expect(page).to have_content('Peep peep!')
    end
end