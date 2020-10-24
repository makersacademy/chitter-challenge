require 'spec_helper'
require 'pg'

feature 'Viewing home page' do
  scenario 'visiting home page' do
    visit('/')
    expect(page).to have_content 'Hello World!'
    # i need to set up my views to <h1> Post a peep!</h1>
  end
end

feature 'My peeps page' do
  scenario 'Viewing the Peeps I posted' do
    visit('/peep')
    expect(page).to have_content "My first peep"
  end
end







# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
