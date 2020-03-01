require 'spec_helper'

feature 'testing infrastructure' do
    
    scenario 'it has a homepage' do
        visit '/homepage'
        expect(page).to have_content 'Welcome to Chitter'
    end

    scenario 'can post a chitter' do
        visit '/homepage'
        fill_in('input', with: 'What a lovely day')
        click_button 'Submit'

        expect(page).to have_content "What a lovely day"
    end
end
