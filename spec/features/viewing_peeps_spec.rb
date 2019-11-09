require 'spec_helper'

feature 'Viewing peeps on Chitter' do
  scenario 'Visiting the index page to view peeps' do
    visit ('/')
    expect(page).to have_content "Peeps"
  end
end
