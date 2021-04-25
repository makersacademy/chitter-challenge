require 'peep'
require './lib/databaseconnection'
require 'timecop'
describe Peep do
  before do 
    Peep.create("Hello Chitter")
    Peep.create("hi")
  end
  let(:time) {Timecop.freeze("17:00").strftime('%d %b %Y at %H:%M')}
  let(:subject) {Peep.new("1", "Hello world", time)}
  let(:peeps) {Peep.all}

  describe 'peep' do
    it 'responds to id' do
      expect(subject).to respond_to(:id)
    end

    it 'responds to texts' do
      expect(subject).to respond_to(:texts)
    end

    it 'responds to time' do
      expect(subject).to respond_to(:time)
    end
  end
  
  describe '.all' do
    it 'returns all peeps' do
      expect(peeps.first.texts).to eq("Hello Chitter")
    end
  end

  describe '.create' do
    it 'creates a peep' do
      expect(peeps.first.texts).to include("Hello Chitter")
    end
  end

  describe '.time' do
    it 'returns a peeps time' do
      
      p expect(subject.time).to eq("25 Apr 2021 at 17:00")
    end
  end

  describe '#id' do
    it 'returns a peeps id' do
      expect(subject.id).to eq("1")
    end
  end

  describe '#texts' do
    it 'returns a peeps text' do
      expect(subject.texts).to eq("Hello world")
    end
  end
end