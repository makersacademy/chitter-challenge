require './app.rb'
require 'spec_helper'

feature 'Testing index page' do
  scenario 'can run app' do
    visit('/')
    expect(page).to have_content('Welcome to Chitter')
 end
end