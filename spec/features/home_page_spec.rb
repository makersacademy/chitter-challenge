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
    connection = PG.connect(dbname: 'my_peeps_test')
    connection.exec("INSERT INTO peeps VALUES (1, 'My first peep')")
    connection.exec("INSERT INTO peeps VALUES (2, 'My second peep')")

    visit('/peep')

    expect(page).to have_content "My first peep"
    expect(page).to have_content "My second peep"

  end
end
