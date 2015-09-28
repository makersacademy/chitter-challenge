require 'spec_helper'

feature 'Creating Peeps' do

  scenario 'I can create a new Peep' do
      visit '/peeps'
      click_button 'Log in'
      fill_in 'username', with: "adrian1"
      fill_in 'password', with: "adrian1"
      click_button 'Sign in'
      click_button 'Send a new Peep'
      fill_in 'message', with: "Hello World! Welcome to Chitter"
      click_button 'Send Peep'
      expect(current_path).to eq '/peeps'
      within 'ul#peeps' do
        expect(page).to have_content("Hello World! Welcome to Chitter")
      end
  end

end
