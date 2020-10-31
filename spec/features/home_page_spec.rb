require 'spec_helper'
require 'pg'
require './lib/model/peep'

feature 'Viewing home page' do
  scenario 'visiting home page' do
    visit('/')
    expect(page).to have_content 'Hello World!'
  end
end

feature 'My peeps page' do
  scenario 'Viewing the Peeps I posted' do
    Peep.create(peep: 'My first peep')
    Peep.create(peep: 'My second peep')

    visit('/peep')

    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"
  end
end
