require 'spec_helper'

describe Peep do

  context 'Testing Database' do

    it 'should be created and then retrived from the db' do
      expect(Peep.count).to eq(0)
      Peep.create(text: "Hello Chitter!")
      expect(Peep.count).to eq(1)
      peep = Peep.first
      expect(peep.text).to eq("Hello Chitter!")
      peep.destroy
      expect(Peep.count).to eq(0)
    end
  end
end
