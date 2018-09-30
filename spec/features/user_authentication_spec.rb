feature 'authentication' do
  before(:each) { User.create(name: 'Test Name', username: 'Test', email: 'test@example.com', password: 'password123') }

  scenario 'a user can sign in' do
    # navigate to sign in page, skipped in future tests
    visit '/'
    click_link('Log In')

    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log In')

    expect(page).to have_content "Hi Test, welcome to Chitter!"
  end

  scenario 'a user sees an error if the given password is wrong' do
    visit '/users/log_in'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'incorrectpassword123')
    click_button('Log In')

    expect(page).not_to have_content "Hi Test"
    expect(page).to have_content "Incorrect email or password"
  end

  scenario 'a user can sign out' do
    # sign in as the user created in the before block
    visit '/users/log_in'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Log In')

    click_button('Log Out')

    expect(page).not_to have_content 'Hi Test'
    expect(page).to have_content 'You have signed out'
  end
end
