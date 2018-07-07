require 'peep'

describe Peep do

  before(:each) do
    @star_wars_fan = User.create('Star Wars Fan', 'star_wars_fan', 'star_wars_fan@gmail.com','pa$$w0rd')
  end

  describe '.create' do
    it 'creates a peep with a user id' do
      Peep.create(@star_wars_fan.id, 'Laugh it up, fuzzball')
      peeps = Peep.all
      contents = peeps.map(&:content)
      expect(contents).to include 'Laugh it up, fuzzball'
    end
    xit 'creates a peep with a time' do
      time_now = Time.new
      # giving too many zeroes
      Peep.create(@star_wars_fan.id, 'Laugh it up, fuzzball', time_now)
      peeps = Peep.all
      times = peeps.map(&:time)
      expect(times).to include time_now
    end
  end

  describe '.all' do
    it 'shows all peeps and their associated users' do
      Peep.create(@star_wars_fan.id,'Laugh it up, fuzzball')
      peeps = Peep.all
      usernames = peeps.map(&:username)
      expect(usernames).to include 'star_wars_fan'
    end
  end
end

# 'I\'m Luke Skywalker and I\'m here to rescue you!'
# 'Help me Obi Wan Kenobi, you\'re my only hope'
