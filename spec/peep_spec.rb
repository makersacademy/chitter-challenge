require 'peep'
require_relative '../lib/database_connection'

describe Peep do

  # let(:user) { double :user, :id => 1, :username => "peeper1234" }
  describe '#create' do

    it 'posts a peep' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test1@test.com")
# p "user: "
#       p user# p user.id
      Peep.create("adding a peep", user.id)
      expect(Peep.all[0][:peep]).to eq "adding a peep"
    end
  end

  describe '#all' do
    it 'returns peeps' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test2@test.com")
      Peep.create('peep a', user.id)
      Peep.create('peep b', user.id)
      expect(Peep.all).to be_a(Array)
    end

    it 'returns peeps sorted' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test3@test.com")
      Peep.create('peep a new', user.id)
      Peep.create('peep b new', user.id)
      # p Peep.all
      expect(Peep.all[0][:peep]).to eq "peep b new"
    end
  end

  describe '#date_only' do
    it 'formats a date' do

      expect(Peep.date_only("2018-10-26 11:26:57.230095")).to eq "26/10/2018 11:26:57"
    end
  end

  describe '#find_username' do
    it 'returns a username from an id' do
      user = User.create("Joe", "Bloggs", "peeper1234", "p4s5w0rd", "test4@test.com")
      expect(Peep.find_username(user.id)).to eq "peeper1234"

    end
  end
end
