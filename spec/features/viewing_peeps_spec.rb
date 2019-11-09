require 'spec_helper'

feature 'Viewing peeps on Chitter' do
  scenario 'Visiting the index page to view peeps' do
    visit ('/peeps')
    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "Happy Saturday:)"
  end
end
