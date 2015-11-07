# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'sign up' do
  scenario 'sign up with email, password, name and user name' do
    expect{sign_up}.to change(User, :count).by(1)
    expect(User.first.email).to eq 'amy@awesome.com'
  end
end
