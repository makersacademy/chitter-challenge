require './app/models/peep'
require 'timecop'

describe Peep do
  describe '.reverse_order' do
    it "shows all Peeps in reverse chronological order" do
      Timecop.freeze(2019, 10, 13, 16, 0, 0)
      first_peep = Peep.create(message: 'first peep', user_id: 1)
      Timecop.freeze(2019, 10, 13, 17, 0, 0)
      Peep.create(message: '2nd peep', user_id: 1)
      Timecop.freeze(2019, 10, 13, 17, 30, 0)
      last_peep = Peep.create(message: 'last peep', user_id: 1)
      peeps = Peep.reverse_order
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq last_peep.message
      expect(peeps.last.message).to eq first_peep.message
    end
  end
end
