require_relative '/Users/jakeatkin/projects/weekend_challenges/Chitter/chitter-challenge/lib/peeps.rb'
require 'pg'


describe Peep do
  describe '.all' do
    it 'Shows a list of peeps' do
      peep = Peep.add(peep: "First peep woo")
      peep = Peep.all
      expect(peep).to include('First peep woo')
    end
  end

  describe '.create' do
    it 'adds a peep' do
      peep = Peep.add(peep: "second peep")
      peep = Peep.all
      expect(peep).to include('second peep')
    end
  end
end

# bookmark = BookmarkManagers.create(url: "http://www.makersacademy.com", title: "Makers Academy")
# BookmarkManagers.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
# BookmarkManagers.create(url: "http://www.google.com", title: "Google")
