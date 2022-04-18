feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Conor')
    fill_in('username', with: 'Thor')
    click_button 'Register'

    expect(page).to have_content 'Welcome, Thor'
  end
end
