feature 'making a peep' do
  scenario 'a user can enter a peep' do
    visit('/peep')
    fill_in('name', with: 'Kris')
    fill_in('peep', with: 'Hi! I am a peep!')
    fill_in('time', with: '4:45pm')
    click_button('Peep!')

    expect(page).to have_content 'At 4:45pm, Kris Peeped: Hi! I am a peep!'
  end
end