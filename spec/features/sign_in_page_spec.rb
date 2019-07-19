feature 'Signin in' do
  scenario 'User can sign in to Chitter' do
    visit('/')
    fill_in('name', with: 'Kaja')
    fill_in('username', with: 'KajaPol')
    fill_in('email', with: 'kaja.polkowska@gmail.com')
    fill_in('password', with: 'cat')

    click_button('Submit')

    expect(page).to have_content 'Kaja'
    # expect(page).to have_content 'KajaPol'
    # expect(page).to have_content 'kaja.polkowska@gmail.com'
    # expect(page).to have_content 'cat'
  end
end
