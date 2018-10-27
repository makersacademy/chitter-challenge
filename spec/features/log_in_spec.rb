feature 'logging in' do
  before do
    add_users_to_test_database
  end

  scenario 'user can fill out email and password on the index page' do
    visit '/'
    expect(page).to have_selector("input[type='text'][placeholder='Email']")
    expect(page).to have_selector("input[type='text'][placeholder='Password']")
    fill_in :email, with: 'albob123@gmail.com'
    fill_in :password, with: 'password123'
    click_button 'Log in'
  end

  scenario 'takes the user to the peeps page with their username greeting' do
    log_in_as_alice_bobson
    expect(page).to have_current_path '/peeps'
    expect(page).to have_content 'Hello albob123'
  end
end
