feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  def sign_up(email: 'alice@example.com',
              password: 'tarts',
              password_confirmation: 'tars',
              name: 'Alice Wonderland',
              username: 'alice123')
      visit '/users/new'
      fill_in :email,     with: email
      fill_in :password,  with: password
      fill_in :password_confirmation, with: password_confirmation
      fill_in :name,      with: name
      fill_in :username,  with: username
      click_button 'Sign up'
  end

end
