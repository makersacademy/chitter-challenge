feature 'Sign up' do
  scenario 'A new user can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, user'
    expect(User.first.email).to eq('email@example.com')
  end
end
