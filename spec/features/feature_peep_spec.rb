require 'spec_helper'

feature 'peep functionality' do
    scenario 'allows user to see a list of peeps' do
        visit '/homepage'
        expect(page).to have_content('Peep peep!')
    end

    scenario 'allows user to post' do
        visit '/homepage'
        fill_in 'user_id', with: 'test_user'
        click_button 'Log in'
        fill_in 'statusbox', with: 'Hello world!'
        click_button 'Peep!'
        expect(page).to have_content('Hello world!')
    end
end