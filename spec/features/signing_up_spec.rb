feature 'User sign up' do
  scenario 'allow to sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bartklu')
    expect(User.first.email).to eq('bkluczynski@gmail.com')
  end
end
