require 'peep'

describe Peep do
  
  describe '.create' do
    it 'A peep can be created' do
      subject.create("First Peep")
      expect(subject.peeps).to include "First Peep"
    end
  end

end