require 'pg'

feature 'Creating peeps' do
  scenario 'A user can create a peep' do
    visit('/peeps/new')
    fill_in('text', with: 'My first peep!')
    click_button('Submit')

    expect(page).to have_content('My first peep!')
  end
end
