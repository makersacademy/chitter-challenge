require "./lib/users"

describe Users do

  describe "#all" do
    it "Returns a user object, which we can extract a name instance from" do
      @test = Users.new(:name => "Florence", :username => "Flo", :email => "flohapgood@icloud.com", :password => "code")
      @test.save
      array = Users.all
      user_object = array[@test.id - 1]
      expect(user_object.name).to eq("Florence")
    end
  end
end
