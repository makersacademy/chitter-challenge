require './app/lib/peep'
require 'pg'
require 'timecop'

RSpec.describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      # connection = PG.connect(dbname: 'chitter_test')
      Peep.create(peep: 'I ate some cake')
      expect(Peep.all.first.peep).to eq('I ate some cake')
      expect(Peep.all.length).to eq(1)
    end

    it 'returns peeps in reverse chronological order' do
      Peep.create(peep: 'I had some cake')
      Peep.create(peep: 'I had some coffee')
      Peep.create(peep: 'I had some bread')
      expect(Peep.all.first.peep).to eq('I had some bread')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      first_peep = Peep.create(peep: 'I ate some cake')
      expect(first_peep).to be_a(Peep)
      expect(first_peep.peep).to eq('I ate some cake')
      expect(first_peep.id).to eq('1')
    end

    it 'creates a new peep with a timestamp' do
      Timecop.freeze
      Peep.create(peep: 'I ate some cake')
      expect(Peep.all.first.time.to_s).to eq(Time.now.to_s)
    end
  end

  describe '.authenticate' do
    it 'returns a user given a correct username and password, if it exists' do
      user = User.create(email: 'hi@hello.com', password: 'password')
      authenticated_user = User.authenticate(email: 'hi@hello.com', password: 'password')
      expect(authenticated_user.id).to eq(user.id)
    end
  end

  
end
