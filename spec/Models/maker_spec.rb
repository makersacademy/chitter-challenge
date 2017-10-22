describe Maker do

  let!(:maker) do
    Maker.create(name: 'Zara',
                username: 'Zara02',
                email: 'maker@example.com',
                password: 'yorkshire1234',
                password_confirmation: 'yorkshire1234')
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_maker = Maker.authenticate(maker.email, maker.password)
    expect(authenticated_maker).to eq maker
  end

  it 'does not authenticate when given an incorrect password' do
  expect(Maker.authenticate(maker.email, 'wrong_stupid_password')).to be_nil
end

end
