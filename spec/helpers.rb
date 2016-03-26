def sign_up
  visit '/'
  click_button 'Sign Up'
  fill_in :name,     with: name
  fill_in :username, with: username
  fill_in :email,    with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
end

def doubles
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
end

def log_in(username:, password:)
  visit '/session/new'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Log in!'
end
