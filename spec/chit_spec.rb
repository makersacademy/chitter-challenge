require 'spec_helper'

describe Chit do

  context 'Demonstration of how datamapper works' do

     it 'should be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no links
      expect(Chit.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      Chit.create(username: '@Diego',
                  text: 'Chit is the real thing')
      # We ask the database how many links we have, it should be 1
      expect(Chit.count).to eq(1)
      # Let's get the first (and only) link from the database
      chit = Chit.first
      # Now it has all properties that it was saved with.
      expect(chit.username).to eq('@Diego')
      expect(chit.text).to eq('Chit is the real thing')
      # If we want to, we can destroy it
      Chit.destroy
      # so now we have no links in the database
      expect(Chit.count).to eq(0)
    end

  end

end