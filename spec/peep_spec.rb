require 'Peep'

describe 'Peep' do

  describe '.all' do
    scenario 'it returns all posted peep (messages) on Chitter' do
      peeps = Peep.all

      expect(peeps).to include('Hello Chitter, this is my first message!',
      'Hello Chitter, this is my second post')
    end
  end 
end 
      