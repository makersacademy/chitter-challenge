require 'spec_helper'

feature 'index page' do
  scenario 'displays a welcome message' do
    visit '/index'
    expect(page).to have_content 'Welcome to Chitter!'
  end
end
