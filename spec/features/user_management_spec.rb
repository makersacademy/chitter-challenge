feature 'Create user' do

  let!(:user) do
    User.create(email: 'user@user.com', password: 'password')
  end

  # I want to sign up for Chitter
  scenario 'can sign up a new user' do
    visit '/users/new'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, user@user.com'
    expect(User.first.email).to eq 'user@user.com'
  end
end
