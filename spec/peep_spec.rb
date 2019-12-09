require 'peep'
require 'user'
require_relative 'helper'

describe Peep do

  let(:user) { User.create(
    email: 'samm@makersacademy.com', 
    password: 'password123', 
    name: 'Sam Morgan',
    username: 'sjmog'
    )
  }

  describe '#all' do
    it "should return a list peeps" do
      Peep.create(message: "test message", user_id: user.id)

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq "test message"
    end
  end

  describe '#create' do
    it "should create a new peep" do
      peep = Peep.create(message: "test message", user_id: user.id)

      persisted_data = persisted_data(table: 'messages', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.message).to eq "test message"
      expect(peep.user_id).to eq user.id
    end
  end

end
