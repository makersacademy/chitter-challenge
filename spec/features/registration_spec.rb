feature 'Registration' do
  scenario 'user can register' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Ricky Martin')
    fill_in('username', with: 'ricky_m')
    click_on('Submit')

    expect(page).to have_content('Hello ricky_m')
  end
end
