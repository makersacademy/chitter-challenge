# require 'spec_helper'

describe Cheet do

  context 'Demonstration of how datamapper works' do

    it 'should be created and then retrieved from the db' do
      # In the beginning our database is empty, so there are no cheets
      expect(Cheet.count).to eq(0)
      # this creates it in the database, so it's stored on the disk
      Cheet.create(text: 'Hello World',
                  time: 'Just now')
      # We ask the database how many cheets we have, it should be 1
      expect(Cheet.count).to eq(1)
      # Let's get the first (and only) cheet from the database
      cheet = Cheet.first
      # Now it has all properties that it was saved with.
      expect(cheet.text).to eq('Hello World')
      expect(cheet.time).to eq('Just now')
      # If we want to, we can destroy it
      # cheet.destroy
      # so now we have no cheets in the database
      # expect(Cheet.count).to eq(0)
    end

  end

end