=begin
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
=end
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, yuliya@example.com')
    expect(User.first.email).to eq('yuliya@example.com')
  end
end
