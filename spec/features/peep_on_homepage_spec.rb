require 'helpers'

feature '#Peep on homepage' do
  include Helpers
  
  scenario 'User to peep on homapage' do
    sign_up
    fill_in :peep, with: 'I love sql'
    click_button 'peep'
    expect(page).to have_content('I love sql')
  end
end
