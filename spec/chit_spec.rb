require 'spec_helper'

describe Chit do

  context "Demonstration of how datamapper works" do

    # This is not a real test, it's simply a demonstration of how it works
    it 'should be able to be created and then retrieved from the database' do
      # In the beginning our database is empty, so there are no Chits
      expect(Chit.count).to eq(0)
      # this creates it in the database, so it's stored on the hard drive
      Chit.create(:username => "@diego", :text => "hola!")
      # So if we ask the database how many Chit we have, it should be 1
      expect(Chit.count).to eq(1)
      # Let's get the first (and only) Chit from the database
      chit = Chit.first
      # Now it has all properties that it was saved with.
      expect(chit.text).to eq("hola!")
      expect(chit.username).to eq("@diego")
      # If we want to, we can destroy it
      chit.destroy
      # so now we have no Chits in the database
      expect(Chit.count).to eq(0)
    end

  end

end
