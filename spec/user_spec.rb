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
    expect(User.find_id(1).name).to eq "Kim"
    expect(User.find_id(1).username).to eq "kim-morgan"
    expect(User.find_id(1).email).to eq "kim_fake_email@gmail.com"
  end
  it 'returns nil if there is no ID given' do
    expect(User.find_id(nil)).to eq nil
  end
  it "should be able to find a user by email address" do
      DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
      User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
      expect(User.find_email("kim_fake_email@gmail.com").name).to eq "Kim"
      expect(User.find_email("kim_fake_email@gmail.com").username).to eq "kim-morgan"
      expect(User.find_email("kim_fake_email@gmail.com").id).to eq "1"
  end


  context "#exists"
  it "should be able to check for username existence" do
    User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(User.username_exists?("kim-morgan")).to be true
    expect(User.username_exists?("hater-faker")).to be false
  end

  it "should be able to check for email existence" do
    User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(User.email_exists?("kim_fake_email@gmail.com")).to be true
    expect(User.email_exists?("hater-faker@gmail.com")).to be false
  end

  context "#authenticate"
  it "should be able to authenticate user" do
    DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
    User.create("Kim", "kim-morgan", "kim_fake_email@gmail.com", "password123")
    expect(User.authenticate("kim_fake_email@gmail.com", "password123").email).to eq "kim_fake_email@gmail.com"
    expect(User.authenticate("kim_fake_email@gmail.com", "wrondpwd")).to be nil
  end

end
