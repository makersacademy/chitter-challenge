feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, kj')
    expect(User.first.email).to eq('kirsten@jones.com')
  end

  scenario 'I cannot sign up with an existing user\'s username or email address' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Username or email address already registered')
  end
end
