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

  scenario 'non registered user attempts to log in' do
    visit '/'
    fill_in('email', with: 'samantha@gmail.com')
    fill_in('password', with: 'tom2000')
    click_button('Sign In')
    expect(page).to have_content('User not found')
  end

  scenario 'an incorrect password is given' do
    visit '/'
    fill_in('email', with: 'tom@gmail.com')
    fill_in('password', with: 'incorrectpassword')
    click_button('Sign In')
    expect(page).to have_content('Incorrect password for tom@gmail.com')
  end
end