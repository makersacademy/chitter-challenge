require 'pg'
require 'spec_helper'


# You don't have to be logged in to see the peeps. Home page should show list of peeps.

feature 'Maker can view list of peeps' do
  scenario 'homepage shows list of peeps in chronological order' do
    Maker.create(peep: "I went on a walk", username: "LTurns", datetime: "08/05/2020")
    visit('/')
    expect(page).to have_content "I went on a walk"
  end
end
