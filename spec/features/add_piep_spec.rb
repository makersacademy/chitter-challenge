feature '/chitter/add_piepje' do
  scenario 'can add a new piepje' do
    visit '/chitter'
    click_button('new user')
    fill_in('username', with: 'user1')
    click_button('Submit')
    click_button('new piepje')
    fill_in('text', with: 'piepje3')
    click_button('Submit')
    expect(page).to have_content('piepje3')
  end
end
