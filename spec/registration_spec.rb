
feature 'registration' do
  scenario 'a user can sign up' do
    visit '/users'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Sign up')
  end
end