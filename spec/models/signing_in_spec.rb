require './app/models/maker'

describe Maker do

  let!(:maker) do
    Maker.create(email: 'olivia@example.com',
            password: '12345678',
            password_confirmation: '12345678')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_maker = Maker.authenticate(maker.email, maker.password)
    expect(authenticated_maker).to eq maker
  end

  it 'does not authenticate when given an incorrect password' do
    expect(Maker.authenticate(maker.email, 'wrong_stupid_password')).to be_nil
  end

end
