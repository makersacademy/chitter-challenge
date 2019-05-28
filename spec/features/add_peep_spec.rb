require './lib/user'

feature 'add peep' do
  scenario 'create a new peep' do
    visit('/peeps/new')
    fill_in 'content', with: 'I am a new peep!'
    click_button('Post')
    expect(page).to have_content('I am a new peep!')
  end
end
