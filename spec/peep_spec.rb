require 'peep'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it "returns all the peeps" do

      peep = Peep.create(message: "message one", user_name: "user1")
      Peep.create(message: "message two", user_name: "user1")
      Peep.create(message: "message three", user_name: "user1")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'message one'
      expect(peeps.first.user_name).to eq 'user1'
    end
  end

  describe '.create' do
    it "creates a new peep" do
      peep = Peep.create(message: 'test message', user_name: 'test_user')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq 'test message'
      expect(peep.user_name).to eq 'test_user'
    end
  end

  describe '.delete' do
    it "deletes a given bookmark" do
      peep = Peep.create(message: 'test message', user_name: 'test_user')

      Peep.delete(id: peep.id)

      expect(Peep.all.length).to eq 0
    end
  end
end
