require './app/models/peep.rb'

RSpec.feature 'posting a message (peep)' do

  scenario 'I would like to post a message and see it' do
    visit '/'
    fill_in 'peep_body', with: 'test message'
    click_button 'Peep'

    expect(current_path).to eq '/'

    within 'ul#peeps' do
      expect(page).to have_content('test message')
    end
  end
end
