feature 'login to chitter' do
  scenario 'it allows a user to log into chitter' do
    visit '/chitter'
    fill_in('name', with: 'Wolverine')
    fill_in('username', with: 'Wolfy')
    fill_in('email', with: 'Xmen@gmail.com')
    fill_in('password', with: '123456')
    fill_in('Add message', with: 'Bright copper kettles')
    click_button('Submit')

    expect(page).to have_content "Wolverine"
    expect(page).to have_content "Wolfy"
    expect(page).to have_content "Bright copper kettles"
  end
end
