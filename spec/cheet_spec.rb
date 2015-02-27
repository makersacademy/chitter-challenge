require 'spec_helper'

  describe Cheet do

    it 'should be created and then retrieved from the database' do
      Cheet.create( message: "Hello world",
                    created_at: "2015-02-27",
                    user_id: 1)
      expect(Cheet.count).to eq(1)
      cheet = Cheet.first
      expect(cheet.message).to eq("Hello world")
      expect(cheet.created_at).to eq(Date.new(2015,2,27))
      expect(cheet.user_id).to eq(1)
      cheet.destroy
      expect(Cheet.count).to eq(0)
    end

  end