feature 'user sign up' do
  let(:username) { 'tester1' }
  let(:user) { 'Test Name' }
  let(:email) { 'email' }
  let(:password) { 'password' }

  scenario 'a new user signs up with valid details' do
    visit '/chitter'
    click_button 'Sign Up'
    expect(current_path).to eq '/chitter/user/new'
    fill_in 'username', with: username
    fill_in 'name', with: user
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Sign Up'
    expect(current_path).to eq '/chitter'
    expect(page).to have_content "Hello #{username}"
    expect(page).not_to have_button "Sign Up"
  end
end