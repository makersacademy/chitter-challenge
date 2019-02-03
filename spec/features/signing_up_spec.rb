feature 'register new account' do
  scenario 'a user can create new account' do
    visit '/new_account'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('name', with: 'Test Guy')
    fill_in('username', with: 'testguy01')
    click_button('Sign up')

    expect(page).to have_content "You are all set, Test Guy!"
  end
end
