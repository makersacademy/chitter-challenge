require_relative '../../app/models/user'

describe User do

  let(:name) { 'Camilla' }
  let(:username) { 'allimac' }
  let(:email) { 'camilla@email.com' }
  let(:password) { 'pass1234' }

  it 'returns the user if the autentication is correct' do
    user = described_class.new(name: name, username: username,
      email: email, password_confirmation: password)
    user.password = password
    user.save
    expect(User.authenticate(email, password)).to eq user
  end

  it 'returns nil if the autentication is not correct' do
    expect(User.authenticate(email, 'wrong password')).to eq nil
  end
end
