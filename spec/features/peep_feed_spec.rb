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

  # Test content for a test peeps
  let(:content_one) { "Hello world! Whassup y'all?" }
  let(:content_two) { "I'm bored!" }

  scenario 'User sees a peep feed on the index page' do
    Peep.create(content: content_one, user_id: user.id)
    visit '/'
    # expect(page).to have_content user.username
    expect(page).to have_content content_one
  end

  scenario 'Peeps are displayed in reverse-chronological order' do
    Peep.create(content: content_one, user_id: user.id)
    Peep.create(content: content_two, user_id: user.id)
    visit '/'
    expect(first('.peep')).to have_content content_two
  end
end
