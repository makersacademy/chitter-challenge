require 'pg'
require 'peep'
require 'database_helper'

describe Peep do

  describe ' .create' do
    it "adds a new peep" do
      peep = Peep.create(username: 'jess', peep: 'Wow! My first peep!')
      persisted_data = persisted_peep_data(id: peep.id)
      time = Time.new.strftime('%F  %I:%M%p')

      expect(peep).to be_a Peep
      expect(peep.username).to eq 'jess'
      expect(peep.peep).to eq 'Wow! My first peep!'
      expect(peep.time).to eq time
    end
  end

  describe ' .all' do
    it " shows all peeps" do
      peep = Peep.create(username: 'jess', peep: 'Wow! My first peep!')
      time = Time.new.strftime('%F  %I:%M%p')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first.username).to eq 'jess'
      expect(peeps.first.peep).to eq 'Wow! My first peep!'
      expect(peeps.first.time).to eq time
    end
  end
end
