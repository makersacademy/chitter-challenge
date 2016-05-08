feature 'User sign up' do
  scenario 'I can sign up for Chitter' do
    sign_up
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end
end
