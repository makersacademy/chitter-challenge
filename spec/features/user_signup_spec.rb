feature 'User signs up' do
  scenario 'successfully' do
    visit '/'
    expect(page).not_to have_content('Welcome, rodcul')
    click_link('Sign up')
    fill_in('username', with: 'rodcul')
    fill_in('email', with: 'rodcul@gmail.com')
    fill_in('password', with: '1234')
    click_button('Sign up')
    expect(page).to have_content('Welcome, rodcul')
  end

  scenario 'with no password, gets error' do
    visit '/'
    expect(page).not_to have_content('Welcome, chidu')
    click_link('Sign up')
    fill_in('username', with: 'chidu')
    fill_in('email', with: 'chidu@gmail.com')
    click_button('Sign up')
    expect(page).to have_content('Password digest must not be blank')
  end

  scenario 'with no username, gets error' do
    visit '/'
    expect(page).not_to have_content('Welcome, chidu')
    click_link('Sign up')
    fill_in('email', with: 'chidu@gmail.com')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'with no email, gets error' do
    visit '/'
    expect(page).not_to have_content('Welcome, chidu')
    click_link('Sign up')
    fill_in('username', with: 'chidu')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content('Email must not be blank')
  end

end
