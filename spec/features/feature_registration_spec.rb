
feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/user_new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testone de testini')
    fill_in('username', with: 'zorro')
    click_button('Register')
    expect(page).to have_content "Welcome on Chitter, zorro!"
  end
end
