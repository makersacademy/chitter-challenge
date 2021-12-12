# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'
require_relative './../web_helper'
Capybara.app = Chitter

feature 'posting to chitter' do
  before do 
    sign_up
  end

  scenario 'can show the peep after posting' do
    fill_in('content', with: 'Test peep')
    click_button('Post')
    expect(page).to have_content('Test peep')
  end
end
