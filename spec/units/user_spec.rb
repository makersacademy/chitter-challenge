require 'user'
context User do
  describe "#self.authenticate" do

    let(:user) { User.create(
                 :email => "bea@bea.com",
                 :password => "hello123",
                 :name => "Beatrice",
                 :username => "beacourage"
                  )}

    it 'user can only login with correct email and password' do
      expect(User.authenticate("bea@bea.com", "hello123")).to eq user
    end
  end
end
