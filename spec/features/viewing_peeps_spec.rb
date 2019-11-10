require 'spec_helper'
require 'pg'

feature 'Viewing peeps on Chitter' do
  scenario 'Visiting the index page to view peeps' do

    Peep.create(text: "This is my first peep")
    Peep.create(text: "Happy Saturday:)")
    Peep.create(text: "Have a good weekend")

    visit ('/peeps')

    expect(page).to have_content "This is my first peep"
    expect(page).to have_content "Happy Saturday:)"
  end
end
