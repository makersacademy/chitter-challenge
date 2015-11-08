describe Maker do

  let!(:maker) do
    Maker.create(name: 'Test Wright',
                 email: 'test@gmail.com',
                 username: 'TestW',
                 password_hash: '123456',
                 password_hash_confirmation: '123456')
  end

  it "authenticates when given a valid username and password" do
    authenticated_maker = Maker.authenticate(maker.username, maker.password_hash)
    expect(authenticated_maker).to eq maker
  end

  it 'does not authenticate when given an incorrect password' do
  expect(Maker.authenticate(maker.username, 'wrong_password')).to be_nil
  end
end
