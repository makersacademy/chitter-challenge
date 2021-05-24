require 'peep'
require 'database_helpers'

describe Peep do

let(:id) { 1 }
let(:content) { double :'Test message' }
let(:user_id) { 12345 }
let(:time_created) { double :time_created}
let(:peep) { Peep.new(id: id, content: content, user_id: user_id, time_created: time_created) }

describe ".initialize" do 
    it 'creates a new instance of Peep' do
      expect(peep).to be_instance_of Peep
      expect(peep.id).to eq 1
      expect(peep.content).to eq content
      expect(peep.user_id).to eq user_id
    end 
end 
  
  describe '.create' do
    it 'creates a new peep' do 
      peep = Peep.create(content: 'This is my first peep!', user_id: user_id)

      persisted_data = persisted_data(table: 'peeps', id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.content).to eq('This is my first peep!')
    end
  end

  describe '.all' do
    it 'returns all peeps' do
      peep_1 = Peep.create(content: "This is my first peep!", user_id: user_id)
      peep_2 = Peep.create(content: "This is my second peep!", user_id: user_id)
      peep_3 = Peep.create(content: "This is my third peep!", user_id: user_id)

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep_1.id
      expect(peeps.first.content).to eq('This is my first peep!')
    end
  end
  
end 