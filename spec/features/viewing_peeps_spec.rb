# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'
require_relative './../web_helper'
Capybara.app = Chitter

feature 'viewing chitter' do
  scenario 'can show peeps in reverse chronological order' do
    old_peep = Peep.create('Older test peep', 'tc1316')
    new_peep = Peep.create('Newer test peep', 'tc1316')

    visit('/')
    
    # Add test expecting to see new_peep first, then old_peep
  end

  scenario 'can show peeps timestamp' do
    Peep.create('Test peep', 'tc1316')
    peep = Peep.all   
    displayed_time = peep.first.timestamp[0..18]
    sign_up
    expect(page).to have_content(displayed_time)
    
  end
end
