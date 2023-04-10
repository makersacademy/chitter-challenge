require "user_repository"

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect(host: '127.0.0.1', dbname: 'chitter_test')
  connection.exec(seed_sql)
end

describe UserRepository do
  before :each do
    reset_tables
  end

  context "when searching by username" do
    it "returns the user" do
      user = UserRepository.new.find_by_username('tcarmichael')
      expect(user).to be_truthy
      expect(user.password).to eq "password123"
      expect(user.name).to eq "Tom Carmichael-Mhanna"
      expect(user.email).to eq "tomcarmichael@hotmail.co.uk"
    end
    it "returns nil if user not found" do
      user = UserRepository.new.find_by_username('jay_dilla')
      expect(user).not_to be_truthy
    end
  end


  
end