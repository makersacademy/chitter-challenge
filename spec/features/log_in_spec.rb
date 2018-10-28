feature 'logging in' do
  before do
    add_users_to_test_database
    visit '/'
  end

  scenario 'user can fill out email and password on the index page' do
    expect(page).to have_selector("input[type='text'][placeholder='Email']")
    expect(page).to have_selector("input[type='password'][placeholder='Password']")
    fill_in :email, with: 'albob123@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'
  end

  scenario 'takes the user to the peeps page with their username greeting' do
    log_in_as_alice_bobson
    expect(page).to have_current_path '/peeps/1'
    expect(page).to have_content 'Hello albob123'
  end

  scenario 'hides log in field when already logged in' do
    log_in_as_alice_bobson
    click_button 'Home'
    expect(page).to have_current_path('/')
    expect(page).not_to have_selector("input[type='text'][placeholder='Email']")
    expect(page).not_to have_selector("input[type='password'][placeholder='Password']")
    click_button 'Sign out'
    expect(page).to have_selector("input[type='text'][placeholder='Email']")
    expect(page).to have_selector("input[type='password'][placeholder='Password']")
  end

  scenario 'displays a warning message if email is incorrect' do
    warning = 'Your email or password is incorrect.'
    fill_in :email, with: '123albob@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'
    expect(page).to have_content warning
    expect(page).to have_current_path '/'
  end

  scenario 'displays a warning message if email is incorrect' do
    warning = 'Your email or password is incorrect.'
    fill_in :email, with: 'albob123@gmail.com'
    fill_in :password, with: '321password'
    click_button 'Log in'
    expect(page).to have_content warning
    expect(page).to have_current_path '/'
  end
end
