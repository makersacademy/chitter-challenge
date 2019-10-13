feature 'Sign out' do

  # Test user account details
  let(:email) { 'test@example.com' }
  let(:password) { 'pass123' }
  let(:name) { 'Melvin Lau' }
  let(:username) { 'melvinlau' }

  scenario 'A logged in user can sign out' do
    User.create(
      email: email,
      password: password,
      name: name,
      username: username
    )
    visit '/'
    within('div.sign-in') do
      fill_in 'email', with: email
      fill_in 'password', with: password
      click_button 'Sign In'
    end
    within('div.user-dashboard') do
      click_button 'Sign Out'
    end
    expect(current_path).to eq '/'
    expect(page).not_to have_content "#{name}"
    expect(page).to have_content 'You have successfully signed out.'
  end
end
