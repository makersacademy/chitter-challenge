feature 'authentication' do
  scenario 'a user can Login' do

    User.create(username: 'test12', password: 'password12')

    visit '/'
    fill_in('input_username', with: 'test12')
    fill_in('input_password', with: 'password12')
    click_button('Login')

    expect(page).to have_content 'Welcome, test12'
  end

  scenario 'a user sees an error if they get their username wrong' do
    User.create(username: 'test12', password: 'password123')

    visit '/'
    fill_in('input_username', with: 'nottherightusername')
    fill_in('input_password', with: 'password123')
    click_button('Login')

    expect(page).not_to have_content 'Welcome, test12'
    expect(page).to have_content 'Please check your username or password.'
  end

  scenario 'a user sees an error if they get their password wrong' do
    User.create(username: 'test12', password: 'password123')

    visit '/'
    fill_in('input_username', with: 'test12')
    fill_in('input_password', with: 'password')
    click_button('Login')

    expect(page).not_to have_content 'Welcome, test12'
    expect(page).to have_content 'Please check your username or password.'
  end

end