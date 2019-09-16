require './lib/peep'
require 'pg'

describe Peep do
  describe '.create' do
    it 'creates a peep' do
      conn = PG.connect(dbname: 'chitter_test')

      peep = Peep.create('first peep')

      expect(peep.peep).to include 'first peep'
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      conn = PG.connect(dbname: 'chitter_test')

      conn.exec("INSERT INTO peeps (peep) VALUES ('First peep')")
      conn.exec("INSERT INTO peeps (peep) VALUES ('Second peep')")

      peeps = Peep.all

      expect(peeps.first.peep).to include 'First peep'
      expect(peeps.last.peep).to include 'Second peep'
    end

    it 'returns all peeps in reverse chronological order' do
      conn = PG.connect(dbname: 'chitter_test')

      conn.exec("INSERT INTO peeps (peep) VALUES ('First peep')")
      conn.exec("INSERT INTO peeps (peep) VALUES ('Second peep')")

      peeps = Peep.all.reverse

      expect(peeps.last.peep).to include 'First peep'
      expect(peeps.first.peep).to include 'Second peep'
    end
  end
end
