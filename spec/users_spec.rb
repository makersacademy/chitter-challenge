require "./lib/users"

describe Users do

  describe "#all" do
    it "Returns a user object, which we can extract a name instance from" do
      @test = Users.new(:name => "Anastasiia", :username => "@ana", :email => "ana@icloud.com", :password => "password")
      @test.save
      array = Users.all
      user_object = array[@test.id - 1]
      expect(user_object.name).to eq("Anastasiia")
    end

    it "Returns a user object, which we can extract a username instance from" do
      @test = Users.new(:name => "Anastasiia", :username => "@ana", :email => "ana@icloud.com", :password => "password")
      @test.save
      array = Users.all
      user_object = array[@test.id - 1]
      expect(user_object.username).to eq("@ana")
    end
  end
end