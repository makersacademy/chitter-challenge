feature 'user can add a cheep' do
  scenario 'A user can add a cheep' do
    visit('/cheeps')
    expect(page).to have_button 'Cheep'
  end
  scenario 'A user can add a cheep to Chitter' do
    visit('/cheeps/new')
    fill_in('cheep', with: 'Another test!')
    click_button('Cheep!')

    expect(page).to have_content('Another test!')
  end
end
