feature 'Sign up' do
  scenario 'Signing up for a user account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome back, Mary'
    expect(User.first.username).to eq 'Mary'
    expect(User.first.email).to eq 'example@example.com'
  end
end
