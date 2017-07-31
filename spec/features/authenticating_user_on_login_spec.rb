feature 'logging in' do
  before { sign_up }
  let(:email) { 'dave@dave.com' }
  let(:username) { 'Dave' }
  let(:correct_password) { '12345' }
  let(:incorrect_password) { '12346' }
  let(:welcome_message) { 'You are logged in as Dave Davis (@Dave)' }
  scenario 'correct credentials (using email)' do
    log_in(email, correct_password)
    expect(page).to have_content(welcome_message)
  end
  scenario 'correct credentials (using username)' do
    log_in(username, correct_password)
    expect(page).to have_content(welcome_message)
  end
  scenario 'incorrect credentials' do
    log_in(email, incorrect_password)
    expect(page).to have_content('Sign in failed. Please try again')
  end
end
