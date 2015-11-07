require_relative '../app/models/user'

describe User do 
  subject(:user) { described_class }
  let(:email) { 'incredible@yev.com' }
  let(:password) { 'bla-bla-bla' }
  let(:name) { 'Yev Insomniak' }
  let(:username) { 'yev_insomniak' }

  it 'A user is authenticated against a given password' do
    user.create(email: email,
                username: username,
                name: name,
                password: password,
                password_confirmation: password)
    expect(user.authenticate(username, password)).to be true
  end
end