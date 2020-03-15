feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('name', with: 'Daria Thompson')
    fill_in('username', with: 'dasha123')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content 'Welcome, Daria Thompson'
  end
end
