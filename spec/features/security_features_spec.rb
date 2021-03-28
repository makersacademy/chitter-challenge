require './app.rb'
require 'spec_helper'
require 'pg'

feature 'user can enter their username and password' do
  scenario 'it return their username' do
    visit '/'
    click_button 'sign up'
    fill_in :username, with: 'Arsene Lupin'
    fill_in :password, with: 'OmarSy'
    click_button 'ubmit'
    expect(page).to have_content "Arsene Lupin's Chits"
  end
end
