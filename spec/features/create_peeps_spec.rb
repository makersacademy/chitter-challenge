require 'spec_helper'

feature 'create a peep' do

  scenario 'I can create a new peep' do
    visit '/peeps/new'
      fill_in 'msg', with: 'my first peep'
      click_button 'Peep!'
      expect(current_path).to eq '/peeps'
         within 'ul#peeps' do
           expect(page).to have_content('my first peep')
         end
       end
     end
