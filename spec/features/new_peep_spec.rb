feature 'posting a peep' do
  scenario 'a user can post a peep to chitter' do
    visit '/chitter'
    fill_in 'post', with: 'Hey chitter!'
    click_button 'Peep'

    expect(page).to have_content('Hey chitter!')
  end
end
