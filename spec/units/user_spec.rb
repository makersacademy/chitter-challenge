require 'user'
context User do
  describe "#self.authenticate" do

    let(:user) { User.create(
                 :id => 1,
                 :name => "Beatrice",
                 :username => "beacourage",
                 :email => "bea@bea.com",
                 :password => "hello12345"
                  )}

    it 'user can only login with correct email and password' do
      expect(User.authenticate("Beatrice", "beacourage", "bea@bea.com", "hello12345")).to eq user
    end
  end
end
