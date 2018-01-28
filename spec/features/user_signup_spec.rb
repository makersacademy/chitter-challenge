feature 'User signup' do
  scenario 'I want to sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Name')
    expect(User.first.email).to eq('someone@emailaddress.com')
  end
end
