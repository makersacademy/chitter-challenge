# in spec/features/viewing_bookmarks_spec.rb
require 'pg'

feature 'Viewing Chitter' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter"
  end
end
