require './app/models/peep.rb'

RSpec.feature 'peeps display a timestamp' do

  scenario 'I want to see all peeps in reverse chronological order' do
    visit '/'
    fill_in 'peep_body', with: '1'
    save_and_open_page

    within 'ul#peeps' do
    expect(page).to have_content('2017-08-26 10:28:19 +0100')
    end
  end
end
