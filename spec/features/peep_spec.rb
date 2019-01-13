feature 'Peep' do
  scenario 'User can post a peep' do
    visit '/'
    fill_in :message, with: 'One man must peep'
    click_on 'Submit'
    expect(page).to have_content('One man must peep')
  end
end
