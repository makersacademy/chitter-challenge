feature 'registration' do
  scenario 'A user can register for a Chitter account' do
    visit '/users/new'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password')
    fill_in('name', with: 'test')
    fill_in('username', with: 'test123')
    click_button 'Submit'
    expect(page).to have_content 'Welcome test123'
  end
end
