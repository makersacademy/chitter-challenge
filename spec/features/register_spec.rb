feature 'register' do

  let(:name) { 'Camilla' }
  let(:username) { 'allimac' }
  let(:email) { 'camilla@email.com' }
  let(:password) { 'pass123' }

  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter
  scenario 'the user registers to Chitter receiving a welcome message' do
    register(name: name, username: username, email: email, password: password, password_confirmation: password)
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome #{name}"
  end

  scenario 'after registration the url includes the user username' do
    register(name: name, username: username, email: email, password: password, password_confirmation: password)
    expect(current_path).to eq "/#{username}/peeps"
  end

  # As a Maker
  # So that I can understand why I can't sign up
  # I need to be warned the two passwords don't match
  scenario 'can\'t happen as the passwords don\'t match' do
    register(name: name, username: username, email: email, password: password, password_confirmation: 'wrongpass')
    expect(current_path).to eq '/register'
    expect(page).to have_content "The two passwords don't match"
  end

  # As a Maker
  # So that I can understand why I can't sign up
  # I need to be warned the email or username already exists


end
