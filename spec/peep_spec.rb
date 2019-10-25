require 'peep'

describe Peep do
  describe '.all' do
    it 'Returns a list of peeps' do
      # Creating three Peeps in test table
      Peep.create(peep: 'This is my first ever Peep!')
      Peep.create(peep: "This is me saying something inspirational.")
      Peep.create(peep: "I am upset about politics right now!")
      # Executing Peep.all for created Peeps, assigning to variable peeps
      peeps = Peep.all
      # var peeps will be mapped array of strings with the three created Peeps in

      # 'Does peeps array have the three created Peeps?'
      expect(peeps[0]).to include('This is my first ever Peep!')
      expect(peeps[1]).to include('This is me saying something inspirational.')
      expect(peeps[2]).to include('I am upset about politics right now!')
    end
  end
end
