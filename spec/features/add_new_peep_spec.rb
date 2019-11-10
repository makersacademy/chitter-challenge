require_relative '../web_helpers'

feature 'posting Peeps to Chitter' do
  scenario 'user can post a peep to Chitter' do
    sign_up
    visit('/peeps/new')
    fill_in 'message', with: 'Hello, this is my first peep.'
    click_button('Post')
    visit('/peeps')
    expect(page).to have_content('Hello, this is my first peep.')
    expect(page).to have_content('ellieSMASH')
    expect(page).to have_content('Ellie')
  end
end
