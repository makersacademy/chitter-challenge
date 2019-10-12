feature 'Add peep' do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  # Test peep content
  let(:content) { "Hello world! Whassup y'all?" }

  scenario 'A signed in user can add a peep' do
    # Create a test user account in the database
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
    # Sign in with correct credentials
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    # Post a new peep
    within('div.add-peep') do
      fill_in 'content', with: content
      click_button 'Post'
    end
    visit '/'
    expect(page).to have_content content
  end
end
