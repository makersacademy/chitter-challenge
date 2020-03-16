# frozen_string_literal: true

require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    visit '/chitter'
    expect(page).to have_content 'Chitter'
  end
end

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    sign_in
    peep

    expect(page).to have_content('This is a test peep')
  end
end
