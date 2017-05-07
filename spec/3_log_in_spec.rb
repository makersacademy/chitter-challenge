require 'spec_helper'
      # As a Maker
      # So that I can post messages on Chitter as me
      # I want to log in to Chitter
feature 'I log in' do
  scenario 'with previously created user, page wellcomes me.' do
    sign_up
    login
    expect(page).to have_content('Unai Motriko Gomez')
  end
end
