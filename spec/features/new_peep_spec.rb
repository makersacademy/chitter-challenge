require_relative './web_helper'

feature 'creating peeps' do
  scenario 'text is shown' do
    visit('/peeps')
    new_peep('My first peep')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text('My first peep')
  end

  scenario 'date/time is shown' do
    visit('/peeps')
    allow(Time).to receive(:now).and_return("2018-05-12 13:49:06")
    new_peep('My first peep')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_text(Time.now)
  end
end
