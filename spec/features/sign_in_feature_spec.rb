feature 'user log in' do
  scenario 'user can sign in' do
    user = User.new('testuser', 'testpassword')
    visit('/chitter/sessions/new')
    fill_in('username', with: 'testuser')
    fill_in('password', with: 'testpassword')
    click_button('Sign in')
    expect(page).to have_content('User logged in is: testuser')
  end
end
