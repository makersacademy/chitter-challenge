require "maker"

describe Maker do
  describe ".create" do
    it "creates a new maker" do
      maker = Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      persistent_data = persistent_data(table: :makers, id: maker.id)

      expect(maker).to be_a Maker
      expect(maker.id).to eq persistent_data[0]['id']
      expect(maker.email).to eq "bensheridanedwards@makers.com"
      expect(maker.name).to eq "Ben"
      expect(maker.username).to eq "BenSE"
    end

    it "hashes a makers password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("password")

      Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
    end

    it "does not create a new maker if the given email has already been used" do
      Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      
      expect(Maker.create(email: "bensheridanedwards@makers.com", 
                          password: "password", 
                          name: "Ben", 
                          username: "Ben10")
                          ).to be nil
    end

    it "does not create a new maker if the given username has already been used" do
      Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      
      expect(Maker.create(email: "bensheridanedwards10@makers.com", 
      password: "password", 
      name: "Ben", 
      username: "BenSE")
      ).to be nil
    end
  end

  describe ".find" do
    it "finds a maker by their ID" do
      maker = Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      result = Maker.find(id: maker.id)

      expect(result.id).to eq maker.id
      expect(result.email).to eq maker.email
      expect(result.name).to eq maker.name
      expect(result.username).to eq maker.username
    end

    it 'returns nil if there is no ID given' do
      expect(Maker.find(id: nil)).to eq nil
    end
  end

  describe ".authenticate" do
    it "returns a user given a correct username and password, provided one exists" do
      maker = Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      authenticated_maker = Maker.authenticate(email: "bensheridanedwards@makers.com", password: "password")

      expect(authenticated_maker.id).to eq maker.id
    end

    it 'returns nil given an incorrect email address' do
      Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      authenticated_maker = Maker.authenticate(email: "wrong_email@gmail.com", password: "password")
    
      expect(authenticated_maker).to eq nil
    end

    it 'returns nil given an incorrect password' do
      Maker.create(email: "bensheridanedwards@makers.com", password: "password", name: "Ben", username: "BenSE")
      authenticated_maker = Maker.authenticate(email: "bensheridanedwards@makers.com", password: "not_my_password")
    
      expect(authenticated_maker).to eq nil
    end
  end
end
