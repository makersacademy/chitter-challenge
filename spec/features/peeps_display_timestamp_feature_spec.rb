require './app/models/peep.rb'

RSpec.feature 'peeps display a timestamp' do

  scenario 'I want to see all peeps in reverse chronological order' do
    visit '/'
    fill_in 'peep_body', with: 'peep'
    click_button 'Peep'
    save_and_open_page

    within 'ul#peeps' do
    expect(page).to have_content('peep 2017-08-26T10:28:19+01:00')
    end
  end
end
