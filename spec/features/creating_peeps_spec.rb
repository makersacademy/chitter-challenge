require 'web_helpers'

feature 'Creating peeps' do
  scenario 'user creates a peep' do
    sign_up(username: 'tester', email: 'test@test.com')
    fill_in :peep_text, with: 'Hello world'
    click_button 'Peep'

    expect(page).to have_content('Hello world')
  end

  scenario "a not logged in user can't see the new peep form" do
    visit('/')
    expect(page).not_to have_button('Peep')
  end

  scenario 'creating a peep that is too long (280+ chars)' do
    visit('/')
    sign_up(username: 'tester', email: 'test@test.com')

    str = "!"*281
    fill_in :peep_text, with: str
    click_button 'Peep'

    expect(page).to have_content("That peep is too long!")
  end
end
