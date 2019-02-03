require 'timecop'
require 'pg'
require './lib/peep'

RSpec.describe 'Peep' do

  describe '.all' do
    it '-should show all peeps' do
      peep = Peep.create(name: 'Jane', message: 'This is a test peep!')
      expect(Peep.all.length).to eq 1
      expect(Peep.all.first.name).to eq 'Jane'
      expect(Peep.all.first.message).to eq 'This is a test peep!'
    end

    it '-should show the timestamp of the peep' do
      Timecop.freeze
      Peep.create(name: 'Jane', message: 'This is a test peep!')
      expect(Peep.time.to_s).to eq(Time.now.to_s)
    end
  end

  describe '.create' do
    it '- should create a new peep' do
      peep = Peep.create(name: 'Jane', message: 'This is a test peep!')
      expect(peep).to be_a Peep
      expect(peep.name).to eq 'Jane'
      expect(peep.message).to eq 'This is a test peep!'
    end
  end
end
