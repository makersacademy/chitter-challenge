feature 'User signs up' do
  scenario 'successfully' do
    visit '/'
    expect(page).not_to have_content('user01')
    click_link('Sign up')
    fill_in('username', with: 'user01')
    fill_in('email', with: 'user01@test.com')
    fill_in('password', with: '1234')
    click_button('Sign up')
    expect(page).to have_content('user01')
  end

  scenario 'with no password, gets error' do
    visit '/'
    expect(page).not_to have_content('user02')
    click_link('Sign up')
    fill_in('username', with: 'user02')
    fill_in('email', with: 'user02@test.com')
    click_button('Sign up')
    expect(page).to have_content('Password digest must not be blank')
  end

  scenario 'with no username, gets error' do
    visit '/'
    expect(page).not_to have_content('user02')
    click_link('Sign up')
    fill_in('email', with: 'user02@test.com')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'with no email, gets error' do
    visit '/'
    expect(page).not_to have_content('user02')
    click_link('Sign up')
    fill_in('username', with: 'user02')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content('Email must not be blank')
  end

end
