require './app.rb'
require 'spec_helper'

feature 'Testing index page' do
  scenario 'checks if home page has content' do
    visit('/')
    expect(page).to have_content('WELCOME TO CHITTER')
  end

end
