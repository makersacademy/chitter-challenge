feature 'User registration' do
  scenario 'a user can sign up' do
    visit '/'
    click_button("Sign Up")
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    fill_in('user_name', with: 'Tom123')
    fill_in('name', with: 'Tom Betts')
    click_button('Submit')

    expect(page).to have_content "Hello Tom123, Welcome to Chitter!"
  end
end
