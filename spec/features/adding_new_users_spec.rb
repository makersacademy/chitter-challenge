feature 'add users' do
  scenario 'users can sign up to the site' do
    visit '/users/new'
    fill_in('email', with: 'testemail@gmail.com')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'testname')
    click_button 'Submit'

    expect(page).to have_content "Welcome, testuser"
  end
end
