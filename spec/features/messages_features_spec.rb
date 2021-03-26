require './app.rb'
require 'spec_helper'
require 'pg'

feature 'a user can post a message to chitter' do
  scenario 'a user post a message which is shown back to them' do
    connection = PG.connect :dbname => 'chitter_test'
    visit '/'
    fill_in 'enter_chitter', with: "Hello chitter world"
    click_on 'Chit'
    expect(page).to have_content "Hello chitter world"
  end
end

feature 'a user can post a message which is saved to a database' do
  scenario 'a user post a message which is saved in a database' do
    connection = PG.connect :dbname => 'chitter_test'
    Messages.add("Hello world of chitter")
    visit '/peep'
    expect(page).to have_content "Hello world of chitter"
  end
end
