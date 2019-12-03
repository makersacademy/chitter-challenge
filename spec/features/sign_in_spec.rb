feature 'Sign in as User' do
  scenario 'A user can sign in' do
    visit('/signin')
    fill_in('user_name', with: 'user_name@email.com')
    fill_in('password', with: 'psw')
    click_button('Sign In')
    expect(page).to have_content(" Welcome user_name@email.com")
  end
end
