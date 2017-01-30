require 'spec_helper'
require_relative '../web_helper.rb'


feature 'Login page' do
  scenario 'its there' do
    visit '/login'
    expect(page).to have_content('Please Login')
  end
  scenario 'i can login' do
    visit '/login'
    fill_in :Username, with: 'frankiey'
    click_button 'Log in'
    expect(page).to have_content('frankie')
  end
end
