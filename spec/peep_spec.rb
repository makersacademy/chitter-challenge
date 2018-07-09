require 'peep'

describe Peep do

  before(:each) do
    @star_wars_fan = User.create('Star Wars Fan', 'star_wars_fan', 'star_wars_fan@gmail.com', 'pa$$w0rd')
  end

  describe '.create' do
    it 'creates a peep with a user id' do
      Peep.create(@star_wars_fan.id, 'Laugh it up, fuzzball')
      peeps = Peep.all
      contents = peeps.map(&:content)
      expect(contents).to include 'Laugh it up, fuzzball'
    end
    it 'creates a peep with a time' do
      # giving too many zeroes
      time_now = Time.new
      Peep.create(@star_wars_fan.id, 'Laugh it up, fuzzball', time_now)
      peeps = Peep.all
      times = peeps.map(&:time)
      expect(times).to include time_now
    end
  end

  describe '.all' do
    it 'shows all peeps and their associated users' do
      Peep.create(@star_wars_fan.id, 'Laugh it up, fuzzball')
      peeps = Peep.all
      usernames = peeps.map(&:username)
      expect(usernames).to include 'star_wars_fan'
    end
  end
end
