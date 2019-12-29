require 'peep'
require 'user'
require 'pg'

describe Peep do

  before do
    test_database_setup
    connection = PG.connect(dbname: 'chitter_test_database')
    @user = connection.exec("INSERT INTO users(user_name, user_handle, email, password, created_at)
      VALUES('Debbie Handler', 'The Real Debs', 'debbie@test.com', 'dkfg14', NOW()) RETURNING user_id;")
    @user_id = @user[0]['user_id']
  end

  describe "#user" do
    it "returns the user that posted the peep" do
      peep = Peep.create(content: "Hello World!", user_id: @user_id)
      expect(peep.user).to be_instance_of User
    end
  end

  describe ".all" do
    it "returns all peeps made in reverse chronological order" do
      Peep.create(content: "Hello World!", user_id: @user_id)
      Peep.create(content: "This breakfast is amazing!", user_id: @user_id)
      peep = Peep.create(content: "I just read the most interesting article", user_id: @user_id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_instance_of Peep
      expect(peeps.first.content).to eq "I just read the most interesting article"
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.created_at).to eq peep.created_at
      expect(peeps[1].content).to eq "This breakfast is amazing!"
      expect(peeps.last.content).to eq "Hello World!"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(content: "I am obsessed with this new pizza joint!", user_id: @user_id)

      expect(peep.content).to eq "I am obsessed with this new pizza joint!"
      expect(peep).to be_instance_of Peep
    end
  end

  describe ".delete" do
    it "deletes the peep" do
      peep = Peep.create(content: "I am obsessed with this new pizza joint!", user_id: @user_id)
      expect(peep.content).to eq "I am obsessed with this new pizza joint!"

      Peep.delete(id: peep.id)
      expect(Peep.all.length).to eq 0
    end
  end

  describe ".update" do
    it "updates the peep" do
      peep = Peep.create(content: "I am obsessed with this new pizza joint!", user_id: @user_id)
      expect(peep.content).to eq "I am obsessed with this new pizza joint!"

      Peep.update(content: "I greatly enjoyed that new pizza joint!", id: peep.id)

      expect(Peep.all.first.content).to eq "I greatly enjoyed that new pizza joint!"
    end
  end

  describe ".find" do
    it "finds the relevant peep" do
      peep = Peep.create(content: "I am obsessed with this new pizza joint!", user_id: @user_id)
      expect(peep.content).to eq "I am obsessed with this new pizza joint!"

      peep_content = Peep.find_content(id: peep.id)

      expect(peep_content).to eq peep.content
    end
  end
end
