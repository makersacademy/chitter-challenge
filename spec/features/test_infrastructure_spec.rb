require 'spec_helper'
# require_relative 'web_helpers.rb'

feature 'Homepage' do

  scenario 'User is welcomed on homepage' do
    visit '/'
    welcome = 'Welcome to Shitter!'
    expect(page).to have_content(welcome)
  end

end

feature 'Peeps display page' do

  scenario 'User can post a peep' do
    post_a_peep
    expect(page).to have_content("This is a test peep!")
  end

  scenario 'Page shows the time each peep was created' do
    post_a_peep
    peep = Peep.all[0]
    expect(page).to have_css('#print-peeps')
  end

end
