require 'peep'
require 'pry'

describe Peep do
  describe '#==' do
    it 'two peeps are equal if their ids match' do
      peep_1 = Peep.new(1, "test peep 1", "user_1", "3:00 PM")
      peep_2 = Peep.new(1, "test peep 2", "user_2", "3:00 PM")

      expect(peep_1).to eq (peep_2)
    end
  end

  describe '.all' do
    it 'returns all peeps in an array' do

      peep_1 = Peep.create(text: "peep test 1", username: "user_1")
      peep_2 = Peep.create(text: "peep test 2", username: "user_2")
      peep_3 = Peep.create(text: "peep test 3", username: "user_3")

      expected_peeps = [
        peep_1,
        peep_2,
        peep_3
      ]

      expect(Peep.all).to eq expected_peeps
    end
  end

  describe '.create' do
    it 'creates a new peep if the character count is equal to or below 280' do
      peep = Peep.create(text: 'peep test 1', username: "user_1")

      expect(Peep.all).to include peep
    end
  end

  describe '.create' do
    it 'does not create a new peep if the character count is above 280' do
      long_text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate."
      peep = Peep.create(text: long_text)

      expect(Peep.all).not_to include peep
    end
  end

  describe '.delete' do
    it 'deletes a peep from the database' do
      peep_1 = Peep.create(text: 'peep test 1', username: "test_user1")
      peep_2 = Peep.create(text: 'peep test 2', username: "test_user2")

      Peep.delete(peep_2.id)

      expect(Peep.all.length).to eq (1)
      expect(Peep.all.first.text).to eq 'peep test 1'
    end
  end

  describe '.edit' do
    it 'updates a peep in the database' do
      Peep.create(text: 'peep test 1', username: "test_user")
      Peep.edit(text: 'edited peep', username: "test_user")

      peeps = Peep.all
      texts = peeps.map(&:text)


      expect(texts).not_to include "peep test 1"
      expect(texts).to include "edited peep"
    end
  end

  describe '.find' do
    it 'find a peep' do
      peep_1 = Peep.create(text: "peep test 1", username: "test_user1")
      peep = Peep.find(peep_1.id)

      expect(peep.text).to eq "peep test 1"
      expect(peep.username).to eq "test_user1"
    end
  end
end
