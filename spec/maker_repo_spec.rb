require 'maker_repository'

def reset_chitter_db
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe MakerRepository do
  before(:each) do 
    reset_chitter_db
  end
  
  describe "#all" do
    it "returns all Makers" do
      makers = MakerRepository.new.all
      
      expect(makers.length).to eq 3
      expect(makers[0].id).to eq  1
      expect(makers[0].name).to eq 'Sean'
      expect(makers[0].email).to eq 'lobe_carpels_06@icloud.com'
    end
  end
  
  describe "#find" do
    it "returns a Maker by ID" do
      maker = MakerRepository.new.find(2)
      
      expect(maker.id).to eq 2
      expect(maker.name).to eq 'Joe'
      expect(maker.email).to eq 'dib_stump.0j@icloud.com'
    end
  end
  
  describe "#find_by_email" do
    it "returns a Maker object for the given email" do
      maker = MakerRepository.new.find_by_email('lobe_carpels_06@icloud.com')
      expect(maker.name).to eq('Sean')
    end
    
    it "returns nothing for an incorrect email" do
      maker = MakerRepository.new.find_by_email('sean@makers.xyz')
      expect(maker).to eq(nil)
    end
  end
  
  describe "#find_by_name" do
    it "returns a Maker object for the given name" do
      maker = MakerRepository.new.find_by_name('Sean')
      expect(maker.id).to eq 1
    end
    
    it "returns nothing for an incorrect name" do
      maker = MakerRepository.new.find_by_name('Sharon')
      expect(maker).to eq(nil)
    end
  end

  describe "#create" do
    it "creates a new Maker" do
      password = BCrypt::Password.create("1234")
      maker = instance_double("Maker", name: "Pete", email: "pete@makers.tech", password: password)
      repo = MakerRepository.new
      repo.create(maker)
      
      expect(repo.all.last.email).to eq("pete@makers.tech")
      expect(repo.all.last.password).to eq(password)
    end
  end
end
