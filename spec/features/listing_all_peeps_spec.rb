require_relative 'helpers/session'

include SessionHelpers

feature 'User views all peeps' do

  scenario 'when opening the home page' do
    sign_up
    add_peep('Look at my breakfast, lolz')
    visit '/'
    expect(page).to have_content('Look at my breakfast, lolz')
  end

end