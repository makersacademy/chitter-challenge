describe "Maker (unit test)" do

  let!(:maker) do
    Maker.create( full_name: "Yu Nit Test",
                  user_name: "testuser",
                  email: "unit@test.com",
                  password: "cantguessthis",
                  password_confirmation: "cantguessthis")
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = Maker.authenticate(maker.email, maker.password)
    expect(authenticated_user).to eq(maker)
  end

  it 'does not authenticate when given an incorrect password' do
    expect(Maker.authenticate(maker.email, 'wrong_stupid_password')).to be_nil
  end

end
