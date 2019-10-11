feature 'Love a Peep' do

  scenario 'I can love a peep and see the value go up' do
    visit("/")
    fill_in('username', with: 'test_username')
    click_button 'Sign In'
    fill_in('peep', with: 'test peep')
    click_button 'Peep It'
    expect(page).to have_content('Number of Loves: 0')
    click_button 'Love'
    expect(page).to have_content('Number of Loves: 1')

  end

end
