# In case you were wondering: Peeps in Chitter are like tweets in Twitter!
feature 'Peep feed' do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  # Create a test user account in the database
  let(:user) {
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
  }

  # Test content for a test peep
  let(:content) { "Hello world! Whassup y'all?" }

  scenario 'User sees a peep feed when visiting the site' do
    Peep.create(content: content, user_id: user.id)
    visit '/'
    # expect(page).to have_content user.username
    expect(page).to have_content content
  end

  scenario 'Reverse chronological order' do

  end
end
