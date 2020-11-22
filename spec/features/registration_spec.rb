feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'samm@makersacademy.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Sam Morgan')
    fill_in('username', with: 'sjmog')
    click_button('Submit')

    expect(page).to have_content "Welcome Sam Morgan!"
  end
end
