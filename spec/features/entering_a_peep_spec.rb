feature 'making a peep' do
  scenario 'a user can enter a peep' do
    visit('/peep')
    fill_in('maker', with: 'Kris')
    fill_in('message', with: 'Hi! I am a peep!')
    fill_in('time', with: '4:45pm')
    click_button('Peep!')

    expect(page).to have_content 'Kris'
    expect(page).to have_content 'Hi! I am a peep!'
    expect(page).to have_content '4:45pm'
  end
end