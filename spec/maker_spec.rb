require "maker"

describe Maker do
  describe ".create" do
    it "creates a new maker" do
      maker = Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
      persistent_data = persistent_data(table: :makers, id: maker.id)

      expect(maker).to be_a Maker
      expect(maker.id).to eq persistent_data['id']
      expect(maker.email).to eq "andrea@gmail.com"
      expect(maker.name).to eq "Andrea"
      expect(maker.username).to eq "Angea89"
    end

    it "hashes the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create).with("mypassword")

      Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
    end

    it "does not create a new maker if the given email has already been used" do
      Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
      
      expect(Maker.create(email: "andrea@gmail.com",
                          password: "mypassword_2",
                          name: "Andrea_2",
                          username: "Angea89_2")
                          ).to be nil
    end

    it "does not create a new maker if the given username has already been used" do
      Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
      
      expect(Maker.create(email: "andrea_2@gmail.com",
                          password: "mypassword_2",
                          name: "Andrea_2",
                          username: "Angea89")
                          ).to be nil
    end
  end

  describe ".find" do
    it "finds a maker by ID" do
      maker = Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
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
    it "returns a user given a correct username and password, if one exists" do
      maker = Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
      authenticated_maker = Maker.authenticate(email: "andrea@gmail.com", password: "mypassword")

      expect(authenticated_maker.id).to eq maker.id
    end

    it 'returns nil given an incorrect email address' do
      Maker.create(email: "andrea@gmail.com", password: "mypassword", name: "Andrea", username: "Angea89")
      authenticated_maker = Maker.authenticate(email: "wrong_email@gmail.com", password: "mypassword")
    
      expect(authenticated_maker).to eq nil
    end
  end
end
