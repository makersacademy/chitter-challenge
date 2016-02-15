feature 'Signing in to and Signing out from Chitter' do
  let(:user) { user = create(:user) }

  scenario 'Signing in successfully' do
    sign_in_as(user, password: 'pass')
    expect(current_path).to eq '/peeps'
    expect(page).to have_content "logged in as #{user.username}"
  end

  scenario 'Invalid username or user does not exist' do
    other_user = build(:user, username: 'other')
    sign_in_as(other_user, password: 'pass')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Invalid username/password'
  end

  scenario 'Invalid password' do
    sign_in_as(user, password: 'wrong_password')
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content 'Invalid username/password'
  end

  scenario 'Signing out successfully' do
    sign_in_as(user, password: 'pass')
    click_button 'Sign out'
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'You have successfully signed out'
  end
end
