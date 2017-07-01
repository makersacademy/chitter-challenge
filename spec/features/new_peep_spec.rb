feature 'new peep' do
  scenario 'I can add a new peep' do
    visit '/peeps'
    fill_in('peep', with: 'Happy it\'s saturday')
    click_button('Peep')
  end
end
