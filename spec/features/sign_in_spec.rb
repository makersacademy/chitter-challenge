feature 'user sign in' do

  before do
    create_user
  end

  scenario 'user attempts to log in' do
    visit '/'
    fill_in('email', with: 'tom@gmail.com')
    fill_in('password', with: 'tom2000')
    click_button('Sign In')
    expect(page).to have_content('Welcome back Tom!')
  end

  scenario 'an invalid email is given' do
    visit '/'
    fill_in('email', with: 'samantha@gmail.com')
    fill_in('password', with: 'tom2000')
    click_button('Sign In')
    expect(page).to have_content('Invalid user')
  end

  scenario 'an invalid password is given' do
    visit '/'
    fill_in('email', with: 'tom@gmail.com')
    fill_in('password', with: 'tom10000')
    click_button('Sign In')
    expect(page).to have_content('Invalid user')
  end

end