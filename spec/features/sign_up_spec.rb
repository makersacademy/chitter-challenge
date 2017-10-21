feature 'Sign up' do
  scenario 'I want users to be able to sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end
