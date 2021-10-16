require 'web_helpers'

feature 'Creating peeps' do
  scenario 'user creates a peep' do
    sign_up(username: 'tester', email: 'test@test.com')
    fill_in :peep_text, with: 'Hello world'
    click_button 'Create peep'

    expect(page).to have_content('Hello world')
  end
end
