# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Signing up' do
  scenario 'New users can sign up' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq('foobar@example.com')
  end
end
