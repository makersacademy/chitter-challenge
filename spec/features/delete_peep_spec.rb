feature 'Delete peep' do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  # Test peep content
  let(:content) { "Hello world! Whassup y'all?" }

  scenario 'User can delete a peep they posted' do

    # Create a test user account in the database
    user = User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
    # Add a new peep belonging to this user
    peep = Peep.create(content: content, user_id: user.id)

    # Sign in with correct credentials
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    expect(page).to have_content content

    # Delete a peep
    within("div#peep-#{peep.id}") do
      click_button 'Delete'
    end
    expect(current_path).to eq '/'
    expect(page).not_to have_content content

  end

end
