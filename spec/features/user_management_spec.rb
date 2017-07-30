feature 'User sign in' do
  scenario 'new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, barney@barney.com')
    expect(User.first.email).to eq 'barney@barney.com'
  end
end
