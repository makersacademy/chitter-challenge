feature 'login to chitter' do
  scenario 'form allowing people to sign in' do
    visit '/'
    fill_in 'first_name', with: 'John'
    fill_in 'last_name', with: 'Smith'
    fill_in 'user_name', with: 'JSmith'
    fill_in 'email', with: 'john.smith@yahoo.co.uk'
    fill_in 'password', with: 'Password'
    click_button('Sign up')
    expect(page).to have_content('John')
  end
end
