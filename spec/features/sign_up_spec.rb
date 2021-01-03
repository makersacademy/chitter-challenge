feature 'sign up' do
  scenario 'user signs up to Chitter' do
    visit('/')
    click_button('Sign Up')
    fill_in('username', with: 'Sujee')
    fill_in('email', with: 'supaman@gmail.com')
    fill_in('password', with: 'iamsupaman')
    click_button('Log In')
  end
end
