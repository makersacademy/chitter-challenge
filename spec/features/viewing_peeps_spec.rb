require 'spec_helper'
require 'pg'

feature 'Viewing peeps on Chitter' do
  scenario 'Visiting the index page to view peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is my first peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Happy Saturday:)');")

    visit ('/peeps')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "Happy Saturday:)"
  end
end
