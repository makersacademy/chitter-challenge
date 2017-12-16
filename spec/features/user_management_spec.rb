feature 'User sign up' do
  scenario 'new users can sign up and add username to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome to Chitter, Lan')
    expect(User.first.email).to eq('lan@example.com')
    expect(User.first.username).to eq('Lan')
  end

  scenario 'asking user to confirm their password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email:    'lan@example.com',
              username: 'Lan',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

end
