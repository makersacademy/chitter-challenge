require 'spec_helper'

feature 'Registrations' do
  context 'Signing up' do
    scenario 'shows a welcome messsage' do
      sign_up
      expect(page).to have_content "Welcome, Sherwin!"
      expect(page.current_path).to eq('/messages')
    end
  end
end