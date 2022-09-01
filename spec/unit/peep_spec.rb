require 'peeps'
require 'pg'
require 'date'
require 'time'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      time_stamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
      Peep.create(message: 'This is a test peep!')
      Peep.create(message: 'This is another test peep!')
      peeps = Peep.all
      expect(peeps[1].message).to eq 'This is a test peep!'
      expect(peeps[0].message).to eq "This is another test peep!"
    end
  end

  describe '.create' do
    it 'adds a peep to the database' do
      time_stamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
      Peep.create(message: 'This is a test peep!')
      peeps = Peep.all
      expect(peeps[0].message).to eq 'This is a test peep!'
    end

    it 'should add time' do
      time_stamp = DateTime.now.strftime('%Y-%m-%d %H:%M')
      Peep.create(message: 'This is a test peep!')
      peeps = Peep.all
      expect(DateTime.parse(peeps[0].time_stamp).strftime('%Y-%m-%d %H:%M')).to eq time_stamp
    end
  end

  describe '#initialise' do
    it 'should initialize with id, message and time_stamp' do
      time_stamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S.%3N')
      peep = Peep.new(id: 1, message: "This is a test peep!", time_stamp: time_stamp)
      expect(peep.id).to eq 1
      expect(peep.message).to eq "This is a test peep!"
      expect(peep.time_stamp).to eq time_stamp
    end
  end

end
