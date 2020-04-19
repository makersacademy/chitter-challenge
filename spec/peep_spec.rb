require 'database_helpers'
require 'peep'
require 'timecop'

describe Peep do

  # describe ".all" do
  #   it 'returns peeps in reverse chronologial order' do
  #     peep = Peep.create(peep: 'this is a peep about a cat')
  #     Peep.create(peep: 'the cat is soft and fluffy')
  #     Peep.create(peep: 'and if you die, it will eat your face')

  #     peeps = Peep.all

  #     expect(peeps.length).to eq 3
  #     expect(peeps.last).to be_a Peep
  #     expect(peeps.last.id).to eq peep.id
  #     expect(peeps.last.peep).to eq 'this is a peep about a cat'
  #     expect(peeps.last.time).to eq Time.now
  #   end
  # end

  describe ".create" do
    before do
      Timecop.freeze(Time.local(2020))
    end

    it "creates a new peep" do
      peep = Peep.create(peep: 'this is a new peep')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.peep).to eq 'this is a new peep'
      expect(peep.time).to eq Timecop.freeze(Time.local(2020))
    end
  end

end
