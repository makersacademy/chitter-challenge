require 'user'

describe User do
  subject(:user) { described_class.new(
    id: 1,
    name: 'Paul',
    email: 'paul@internet.com',
    password: 'Tr1ckyPa55w0rd',
    username: 'PaulK',
    created: "2022-03-20 19:31:52.789054+00"
    )
  }  

  it 'stores an id' do
    expect(user.id).to eq 1
  end

  it 'stores the name' do
    expect(user.name).to eq 'Paul'
  end

  it 'stores the email' do
    expect(user.email).to eq 'paul@internet.com'
  end

  it 'stores the username' do
    expect(user.username).to eq 'PaulK'
  end

  it 'stores the timestamp of user creation' do
    expect(user.created).to eq DateTime.parse("2022-03-20 19:31:52.789054+00")
  end

  describe '#correct_password?' do
    context 'when given the correct password' do
      it 'returns true' do
        expect(user.correct_password?('Tr1ckyPa55w0rd')).to be true
      end
    end
    context 'when given an incorrect password' do
      it 'returns false' do
        expect(user.correct_password?('incorrect password')).to be false
      end
    end
  end
end
