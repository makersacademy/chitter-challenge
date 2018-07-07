require 'peep'

describe Peep do

  before(:each) do
    star_wars_fan = User.create('Star Wars Fan', 'star_wars_fan', 'star_wars_fan@gmail.com','pa$$w0rd')
  end

  describe '.all/.create' do
    it 'shows all peeps' do
      Peep.create(star_wars_fan.id,'Laugh it up, fuzzball')
      peeps = Peeps.all
      contents = peeps.map(&:content)
      expect(contents).to include 'Laugh it up, fuzzball'
    end
  end

end

#   describe '.create' do
#     it 'creates a new peep in the database' do
#       Peep.create(star_wars_fan.id,'Laugh it up, fuzzball')
#       peeps = Peep.all
#       contents = peeps.map(&:content)
#       expect(contents).to include 'Laugh it up, fuzzball'
#     end
#   end
#
#
# 'I\'m Luke Skywalker and I\'m here to rescue you!'
# 'Help me Obi Wan Kenobi, you\'re my only hope'
