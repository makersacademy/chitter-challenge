require 'spec_helper'

feature 'Registrations' do
  context 'Signing up' do
    scenario 'shows a welcome messsage' do
      sign_up
      expect(page).to have_content "Welcome, Sherwin!"
      expect(page.current_path).to eq('/messages')
    end

    scenario 'with a username that already exists' do
      sign_up
      sign_up
      expect(page).to have_content "Username already exists."
    end
  end
end
