describe Maker do

  let!(:maker) do
    Maker.create(name: 'Test Wright',
                 email: 'test@gmail.com',
                 username: 'TestW',
                 password: '123456',
                 password_confirmation: '123456')
  end

  it "authenticates when given a valid username and password" do
    authenticated_maker = Maker.authenticate('TestW', '123456')
    expect(authenticated_maker).to eq maker
  end

  it 'does not authenticate when given an incorrect password' do
  expect(Maker.authenticate(maker.username, 'wrong_password')).to be_nil
  end
end
