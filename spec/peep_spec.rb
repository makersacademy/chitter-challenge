require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(username: 'AsadK',date: '01/01/2018',content: "Hello peeps!")

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.username).to eq peep.username
      expect(peeps.first.date).to eq peep.date
      expect(peeps.first.content).to eq peep.content
    end
  end

  describe ".create" do
    it "Creates a peep" do
      peep = Peep.create(username: "AsadK", date: '02/02/2018', content: "Hello sir!")
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.username).to eq 'AsadK'
      expect(peep.date).to eq '2018-02-02'
      expect(peep.content).to eq 'Hello sir!'
    end
  end

end
