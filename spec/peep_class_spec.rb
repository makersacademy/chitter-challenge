require './lib/peep'
require './app.rb'
require 'pg'

describe Peep do
  describe '.all' do
    it 'should display an array of peeps in reverse chronological order' do
      peep = Peep.create(message:'Hello, this is a test')
      Peep.create(message:'second test...')
      Peep.create(message:'third test...')
      peeps = Peep.all
     expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'third test...'
    end
  end

  describe '.create' do
    it 'creates a new peep with the time and username' do
      time_now = Time.now
      allow(Time).to receive(:now).and_return(time_now)
      formatted_time = time_now.strftime("%Y-%m-%d %I:%M:%S")
      peep = Peep.create(message: 'Test4')
      
      expect(peep).to be_a Peep
      expect(peep.message).to eq 'Test4'
      expect(peep.time).to eq formatted_time
    end
  end

end