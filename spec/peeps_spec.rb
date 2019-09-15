require 'peeps'
require 'timecop'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      time_new = Time.new
      Timecop.freeze(time_new) do

        truncate_table

        peep = Peeps.post("This is my first peep", time_new, "tony-smith")
        Peeps.post("This is my second peep", time_new, "tony-smith")
        Peeps.post("This is my third peep", time_new, "tony-smith")

        peeps = Peeps.all

        expect(peeps.length).to eq 3
        expect(peeps[0]).to be_a Peeps
        expect(peeps[0].username).to eq 'tony-smith'
        expect(peeps.first.id).to eq peep.id
        expect(peeps.first.text).to eq 'This is my first peep'
      end
    end
  end
end
