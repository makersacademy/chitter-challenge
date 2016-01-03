  # As a Maker
  # So that I can post messages on Chitter as me
  # I want to sign up for Chitter

feature 'User Sign-Up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Mr Example')
    expect(User.first.email).to eq('example@example.com')
  end
end
