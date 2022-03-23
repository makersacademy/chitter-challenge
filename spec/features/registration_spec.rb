feature 'registration' do
  scenario 'a user can sign up' do
    visit '/signup'
    fill_in('name', with: 'Diego')
    fill_in('username', with: 'cat_boy')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, Diego"
  end
end
