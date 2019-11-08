feature 'making a peep' do
  scenario 'a user can enter a peep' do
    visit('/peep')
    fill_in('name', with: 'Kris')
    fill_in('peep', with: 'Hi! I am a peep!')
    click_button('Peep!')

    expect(page).to have_content 'Kris Peeped: Hi! I am a peep!'
  end
end