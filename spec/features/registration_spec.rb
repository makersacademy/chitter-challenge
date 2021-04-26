feature 'registration' do
  scenario 'a user can sign up' do
    visit('/sign_up')
    fill_in('name', with: 'Test Name')
    fill_in('username', with: 'test1')
    fill_in('email', with: 'test@test.com')
    fill_in('password', with: 'password123')
    click_button('Sign Up')
    expect(page).to have_content "Thank you for signing up test1!"
  end
end
