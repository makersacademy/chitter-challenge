require 'user'

describe User do
  it 'should exist as a User instance' do
    expect(User.create).to be_a User
  end

  before (:each) do
    @user = User.create(name: "testname", username: "testusername", password: "testpassword", email: "testemail")
  end
  it 'should have name attribute' do
    expect(@user.name).to eq "testname"
  end
  it 'should have email attribute' do
    expect(@user.email).to eq "testemail"
  end
  it 'should have password attribute' do
    expect(@user.password).to eq "testpassword"
  end
  it 'should have usename' do
    expect(@user.username).to eq "testusername"
  end
end
