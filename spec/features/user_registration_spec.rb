feature 'registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'Test')
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Hi Test, welcome to Chitter!"
  end
end
