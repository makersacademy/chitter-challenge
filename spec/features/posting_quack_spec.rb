# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

Capybara.app = DuckBoard

feature 'posting a quack' do
  scenario 'adds quack to top of list' do
    visit('/')
    fill_in('display_name', with: 'Elvis')
    click_button('Submit')
    fill_in('message', with: 'A little less conversation, a little more action')
    click_button('Post my quack')
    expect(page).to have_content('A little less conversation, a little more action')
  end
end
