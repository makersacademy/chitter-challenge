feature 'Sign in' do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  before(:each) do
    # Create a test user account in the database
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
  end

  scenario 'An existing user can sign in with the correct email and password' do
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    expect(page).to have_content "#{name}"
  end

  scenario 'User gets an error if incorrect email is given' do
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: 'wrong_email@example.com'
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    expect(page).to have_content 'Please check your email or password.'
  end

  scenario 'User gets an error if incorrect password is given' do
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: 'wrong password'
      click_button 'Sign In'
    end
    expect(page).to have_content 'Please check your email or password.'
  end

end
