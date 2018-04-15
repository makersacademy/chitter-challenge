require 'peeps'

describe Peeps do
  describe '.all' do

    it 'returns all the peeps as an array' do
      User.create({email: 'jbloggs@makersacademy.com', username: 'jbloggs', password: 'jbloggsrocks', name: 'Joe Bloggs'})
      Peeps.create({user: 'jbloggs', peep: 'hi makers'})
      Peeps.create({user: 'jbloggs', peep: 'I love ruby programming'})
      expect(Peeps.all).to eq ['hi makers', 'I love ruby programming']



    end
  end

  describe '.create' do
    it 'creates a new peep' do
      User.create({email: 'jbloggs@makersacademy.com', username: 'jbloggs', password: 'jbloggsrocks', name: 'Joe Bloggs'})
      options = {user: 'jbloggs', peep: 'normal life'}
      Peeps.create(options)
      expect(Peeps.all).to include options[:peep]
    end

  end

  describe '.is_user?' do
    it 'returns true if user has signed up for chitter' do
      User.create({email: 'jbloggs@makersacademy.com', username: 'jbloggs', password: 'jbloggsrocks', name: 'Joe Bloggs'})
      User.create({email: 'ironman@makersacademy.com', username: 'iman123', password: 'imanrocks', name: 'Robert Downey Jr'})
      User.create({email: 'batman@makersacademy.com', username: 'batman123', password: 'savegotham', name: 'Bruce Wayne'})
      expect(Peeps.is_user?('jbloggs')).to eq true

    end
  end
end
