require 'user'

describe User do
  context "Creates a new user, owen farrel with readable attributes" do

    email = "owenfarrel@gamil.com"

    before(:each) do
      User.new("OwenFarrel1", "password", email, 'Owen', 'Farrel')
      User.login('OwenFarrel1','password')
    end

    it 'has a first name' do
      expect(User.fname).to eq 'Owen'
    end

    it 'has a surname' do
      expect(User.sname).to eq 'Farrel'
    end

    it 'has an email' do
      expect(User.email).to eq email
    end

    it 'has a username' do
      expect(User.username).to eq 'OwenFarrel1'
    end

  end

  context "Creates a new user, Henry Slade, with readable attributes" do

    email = "henryslade@gamil.com"

    before(:each) do
      User.new("Sladelord92", "password2", email, "Henry", "Slade")
      User.login('Sladelord92','password2')
    end

    it 'has a first name' do
      expect(User.fname).to eq 'Henry'
    end

    it 'has a surname' do
      expect(User.sname).to eq 'Slade'
    end

    it 'has an email' do
      expect(User.email).to eq email
    end

    it 'has a username' do
      expect(User.username).to eq 'Sladelord92'
    end

    it "Returns error::passwrod when incorect password" do
      expect(User.login('Sladelord92', 'gobbledygoop')).to eq 'error::password'
    end

  end

  it 'Returns error::no_user when no username matches' do
    expect(User.login('CourtneyLawes', 'password')).to eq 'error::no_user'
  end

end
