feature 'allows login' do
  let(:name) { 'Thelonious' }
  let(:username) { 'Thelo88' }
  let(:email) { 'thelonious_monk@piano.com' }
  let(:password) { '884lyf' }
  let(:password_confirmation) { '884lyf' }
  let(:maker) do
    Maker.create(name: name,
                 email: email,
                 username: username,
                 password: password,
                 password_confirmation: password_confirmation)
  end

  scenario 'has correct credentials' do
    log_in(username: maker.username, password: maker.password)
    expect(page).to have_content "Oh hey #{maker.name}, what will you peep about today?"
  end

  scenario 'authenticates user log in with valid email and password' do
    logged_in_maker = Maker.authenticate(maker.username, maker.password)
    expect(logged_in_maker).to eq maker
  end

  scenario 'fails authenication with wrong password' do
    expect(Maker.authenticate(maker.username, 'not_password')).to be_nil
  end
end
