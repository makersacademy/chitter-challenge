require 'user'
describe ".all" do
  it "stores & shows the peeps" do
    user = User.all
    expect(user[0].username).to include "Bob"
  end

  describe ".create" do
    it "adds username & password to the database" do
      peep = User.create(username: 'Brian', password: 'cat')
      expect(peep.username).to include "Brian"
    end
  end
end
