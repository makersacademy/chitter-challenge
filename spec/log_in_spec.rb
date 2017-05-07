require 'spec_helper'
# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'I log in' do
  scenario 'I log in as Unai' do
      expect(page).to have_content('euskaldun')
  end
end
