require_relative '../web_helpers'

feature 'Peeping:' do
  include Helpers

  scenario 'User can send a peep.' do
    sign_up
    log_in
    peep
    expect(page).to have_content 'Chitter'
    expect(page).to have_content 'My test peep'
  end

  scenario 'A peep cannot be sent if user is not logged in.' do
    visit '/peeps/new'
    expect(page).to have_content "Please log in to Peep!"
  end
end