
feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/user_new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testone')
    fill_in('username', with: 'Kaiser')
    click_button('Register')
    expect(page).to have_content "Kaiser"
    expect(page).to have_content "Chitter Peeps Page"
    expect(page).to have_content "Users:"
  end
end
