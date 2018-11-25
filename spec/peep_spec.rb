require "peep"

describe Peep do
  describe ".create" do
    it "creates a new peep in the database" do
      peep = Peep.create(username: "KirillZ", date: "10/10/2018", content: "Hello World!")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data["id"]
      expect(peep.username).to eq "KirillZ"
      expect(peep.date).to eq "2018-10-10 00:00:00"
      expect(peep.content).to eq "Hello World!"
    end
  end

  describe ".all" do
    it "returns all peeps" do
      peep = Peep.create(username: "Kirill",date: "03/16/2019",content: "Its my brithday!")
      Peep.create(username: "Jamie",date: "03/11/2020",content: "What a great day!")
      Peep.create(username: "Asad",date: "02/02/2017",content: "I am so alone")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.username).to eq peep.username
      expect(peeps.first.date).to eq peep.date
      expect(peeps.first.content).to eq peep.content
    end
  end
end
