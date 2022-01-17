# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

Capybara.app = ChitterBoard

feature 'entering display_name' do
  scenario 'submitting name' do
    visit('/')
    fill_in('display_name', with: 'Elvis')
    click_button('Submit')
    expect(page).to have_content('Welcome Elvis!')
  end
end
