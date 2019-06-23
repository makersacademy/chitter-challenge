require 'user'

describe User do
  describe '.create' do
    it "adds a new user to the database" do
      user = User.create(
        first_name: "Joe",
        last_name: "Bloggs",
        username: "jbloggs",
        email: "joe.bloggs@testemail.com",
        password: "IAmJoeBloggs"
      )

      expect(user.first_name).to eq("Joe")
      expect(user.last_name).to eq("Bloggs")
      expect(user.username).to eq("jbloggs")
      expect(user.email).to eq("joe.bloggs@testemail.com")
    end
  end
end
