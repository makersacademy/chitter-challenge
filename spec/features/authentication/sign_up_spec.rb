require 'spec_helper'

feature 'Registrations' do
  context 'Signing up' do
    scenario 'can post as user' do
      sign_up
      fill_in('text', with: 'Hello World!')
      click_button('Submit')
      expect(page).to have_content "Sherwin"
      expect(page.current_path).to eq('/messages')
    end

    scenario 'with a username that already exists' do
      sign_up
      sign_up
      expect(page).to have_content "Username already exists."
    end
  end
end
