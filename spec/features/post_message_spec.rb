# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'
Capybara.app = Chitter

feature 'posting to chitter' do
  scenario 'can show the peep after posting' do
    visit('/')
    fill_in('post_peep', with: 'Test peep')
    click_button('Post')
    expect(page).to have_content('Test peep').once
  end
end
