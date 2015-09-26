require 'spec_helper'

feature 'Creating Peeps' do

  scenario 'I can create a new Peep' do
      visit 'peeps/new'
      fill_in 'message', with: "Hello World! Welcome to Chitter"
      click_button 'Send Peep'
      expect(current_path).to eq '/peeps'
      within 'ul#peeps' do
        expect(page).to have_content("Hello World! Welcome to Chitter")
      end
  end

end
