require 'chitter'

describe 'Chitter' do

  subject (:chit) {double(:chit, :post => "I like bagels", :time => Time.now.asctime)}
  subject(:user) {double(:user, :username => "testemail@gmail.com", :password => "test")}

  before (:each) do
    Chitter.connect
  end

  describe "#add" do

    before (:each) do
      Chitter.add(chit)
    end

    it "increments the size of the chitter database by one" do
      expect(Chitter.show_chits.length).to eq 1
    end

    it "adds a chit with a string and the correct time included in the object" do
       expect(Chitter.show_chits[0].post).to eq "I like bagels"
       expect(Chitter.show_chits[0].time).to eq Time.now.asctime
     end
      
  end

  describe "#show_chits" do

    it "returns all the chits as an array sorted in reverse chronological order" do
      cheets = []
      10.times do
        cheets << chit
        Chitter.add(chit)
      end
      cheets.reverse
      for i in 0..Chitter.show_chits.length - 1
        expect(Chitter.show_chits[i].time).to eq cheets[i].time
      end 
    end
    
  end


  describe "create_user" do

    it "creates a user of chitter with a username and password" do
     Chitter.create_user(user)
     expect(Chitter.show_users.length).to eq 1
     expect(Chitter.show_users[0].id.to_i).to eq 1
     expect(Chitter.show_users[0].username).to eq user.username
     expect(Chitter.show_users[0].password).to eq user.password
    end
  
  end
  
end