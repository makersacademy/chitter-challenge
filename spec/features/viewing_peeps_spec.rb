# frozen_string_literal: true

require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/'
    expect(page).to have_content 'Chitter'
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peep.create(text: 'This is a test peep')

    visit '/chitter'

    expect(page).to have_content('This is a test peep')
  end
end
