require 'user'

describe User do

  context "#create"
  it "should create user" do
    user = User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(user.name).to eq "Kim"
    expect(user.username).to eq "kim-morgan"
    expect(user.email).to eq "kim_fake_email@gmail.com"
  end

  context "#find"
  it "should be able to find user by id" do
    DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
    User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(User.find(1).name).to eq "Kim"
    expect(User.find(1).username).to eq "kim-morgan"
    expect(User.find(1).email).to eq "kim_fake_email@gmail.com"
  end
  it 'returns nil if there is no ID given' do
    expect(User.find(nil)).to eq nil
  end

end
