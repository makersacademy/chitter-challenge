feature 'register' do

  let(:name) { 'Camilla' }
  let(:username) { 'allimac' }
  let(:email) { 'camilla@email.com' }
  let(:password) { 'pass123' }

  scenario 'the user registers to Chitter receiving a welcome message' do
    register(name: name, username: username, email: email,
              password: password, password_confirmation: password)
    expect(page.status_code).to eq 200
    expect(page).to have_content "Welcome #{name}"
  end

  scenario 'after registration the url includes the user username' do
    register(name: name, username: username, email: email,
              password: password, password_confirmation: password)
    expect(current_path).to eq "/#{username}/peeps"
  end

  scenario 'can\'t happen as the passwords don\'t match' do
    register(name: name, username: username, email: email,
              password: password, password_confirmation: 'wrongpass')
    expect(current_path).to eq '/register'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'can\'t happen if username or email are already taken' do
    register(name: name, username: username, email: email)
    register(name: name, username: username, email: email)
    expect(current_path).to eq '/register'
    expect(page).to have_content "Username is already taken Email is already taken"
  end

end
