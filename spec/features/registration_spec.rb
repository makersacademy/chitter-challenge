feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('email', with: 'test_email@notreal.com')
    fill_in('password', with: 'password123');
    fill_in('user_name', with: '@testuser');
    fill_in('name', with: 'Joe Bloggs');
    click_on('Submit');
    expect(page).to have_content "Welcome, @testuser"
  end
end
