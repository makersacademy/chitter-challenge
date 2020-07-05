require "peep"
require "database_helpers"

describe Peep do
  describe ".all" do
    it "returns a list of peeps" do
      connection = PG.connect(dbname: "chitter_test")
      
      # Add the test data
      peep = Peep.create(text: "What a lovely day", name: "Iryna")
      Peep.create(text: "Hello", name: "Stacy")
      Peep.create(text: "Hi", name: "Andrey")

      peeps = Peep.all
      
      expect(peeps.length).to eq 3
      expect(peep).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.name).to eq "Iryna"
      expect(peeps.first.text).to eq "What a lovely day"
    end
  end

  describe ".create" do
    it "creates a new peep" do
      peep = Peep.create(text: "What a sunny day", name: "Mickey")
      persisted_data = persisted_data(id: peep.id)  

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first["id"]
      expect(peep.name).to eq "Mickey"
      expect(peep.text).to eq "What a sunny day"
    end
  end

  #   it "does not create a new bookmark if the URL is not valid" do
  #     Bookmark.create(url: "not a real bookmark", title: "not a real bookmark")
  #     expect(Bookmark.all).to be_empty
  #   end
  # end

  describe ".delete" do
    it "deletes the given peep" do
      peep = Peep.create(text: "What a sunny day", name: "Mickey")

      Peep.delete(id: peep.id)

      expect(Peep.all.length).to eq 0
    end
  end

  describe ".update" do
    it "updates the peep with the given data" do
      peep = Peep.create(name: "Stacey", text: "Hello")
      updated_peep = Peep.update(id: peep.id, text: "Hello :)", name: "Stacy")
  
      expect(updated_peep).to be_a Peep
      expect(updated_peep.id).to eq peep.id
      expect(updated_peep.name).to eq "Stacy"
      expect(updated_peep.text).to eq "Hello :)"
    end
  end

  describe ".find" do
    it "returns the requested peep object" do
      peep = Peep.create(text: "Hi", name: "Andrey")

      result = Peep.find(id: peep.id)

      expect(result).to be_a Peep
      expect(result.id).to eq peep.id
      expect(result.name).to eq "Andrey"
      expect(result.text).to eq "Hi"
    end
  end
end