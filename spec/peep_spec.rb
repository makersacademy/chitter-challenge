require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(post: "This is my first Peep", poster: '@tester', poster_name: 'Mr Test')
      Peep.create(post: "And this is my second", poster: '@tester', poster_name: 'Other Test')

      peeps = Peep.all

      expect(peeps.last.post).to include "This is my first Peep"
      expect(peeps.last.id).to eq peep.id
      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(post: "Testing a Peep", poster: '@tester', poster_name: 'Mr Test')
      table_data = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.id).to eq table_data.first['id']
      expect(peep.post).to eq 'Testing a Peep'
    end
  end
end
