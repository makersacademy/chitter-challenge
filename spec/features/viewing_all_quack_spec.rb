# frozen_string_literal: true

require './app'

feature 'viewing quacks' do
  scenario 'shows a list of quacks' do
    visit('/')
    expect(page).to have_content('Love is strength')
    expect(page).to have_content('Dream it, be it')
    expect(page).to have_content('The last word')
  end
end