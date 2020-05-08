feature 'Adding peep' do
  scenario 'User posts peep to chitter' do
    visit('/peeps/new')
    fill_in('peep', with: 'Good morning!')
    click_button 'Peep!'
    expect(page).to have_content 'Good morning!'
  end
end
