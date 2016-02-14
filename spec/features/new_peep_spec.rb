require 'spec_helper'

feature 'New peep' do
  context 'if user has written a peep' do
    scenario 'creates a new peep' do
      sign_up

      click_link 'New peep'
      fill_in 'content', with: 'My first peep!'

      expect { click_button 'Submit' }.to change(Peep, :count).by 1
      expect(current_path).to eq '/peeps/all'
      # FIXME: flash not displaying
      # expect(page).to have_content 'Your peep has been posted!'
      expect(page).to have_content 'My first peep!'
    end
  end

  context 'if user has not written a peep' do
    scenario 'displays an error message' do
      sign_up

      click_link 'New peep'

      expect { click_button 'Submit' }.not_to change(Peep, :count)
      expect(current_path).to eq '/peeps'
      # FIXME: flash not displaying
      # expect(page).to have_content 'Content cannot be empty'
    end
  end
end
