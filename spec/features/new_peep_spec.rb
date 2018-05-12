require_relative './web_helper'

feature 'creating peeps' do
  scenario 'peep is less than 140 characters' do
    visit('/peeps')
    new_peep('My first peep')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep')
  end
end
