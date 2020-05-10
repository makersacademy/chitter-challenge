require 'spec_helper'
require 'database_helpers'
require 'peep'

describe Peep do

  let(:subject) { described_class.new(created_at: Time.new(2020, 10, 31, 17, 52, 3)) }

  describe '.all' do
    it "returns all peeps" do

      #test data
      peep = Peep.create(message: "Message 1", name: "Jo")
      Peep.create(message: "Message 2", name: "John")
      Peep.create(message: "Message 3", name: "Sam")
      persisted_data = persisted_data(id: peep.id)

      peeps = Peep.all 
      
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peeps.first.name).to eq 'Jo'
      expect(peeps.first.message).to eq 'Message 1'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'This is my first peep', name: 'Jo')
      persisted_data = persisted_data(id: peep.id)
  
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.name).to eq 'Jo'
      expect(peep.message).to eq 'This is my first peep'
    end
  end

  describe '.delete' do
    it 'deletes the given peep' do
      peep = Peep.create(message: 'Hello', name: 'Jo')
  
      Peep.delete(id: peep.id)
  
      expect(Peep.all.length).to eq 0
    end
  end

end