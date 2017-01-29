require 'spec_helper'
require_relative '../web_helper.rb'


feature 'Login page' do
  scenario 'its there' do
    visit '/login'
    expect(page).to have_content('Please Login')
  end
end
