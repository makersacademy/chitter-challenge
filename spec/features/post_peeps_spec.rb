feature 'Posting peeps' do
  scenario 'User can post a peep to chitter' do
    visit('/')
    fill_in 'peep', with: 'My first peep!'
    click_button 'Peep'
    expect(page).to have_content('My first peep!')
  end
end
