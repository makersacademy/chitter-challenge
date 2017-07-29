feature 'Create user' do
  scenario 'Can sign up a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, user@user.com'
    expect(User.first.email).to eq 'user@user.com'
  end
end
