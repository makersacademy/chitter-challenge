require_relative '../../app.rb'
require 'spec_helper'
require 'pg'

feature 'Peep Homepage' do
  scenario 'Can see peeps' do
    visit '/peeps'
    expect(page).to have_content("Hello World")
  end
end
