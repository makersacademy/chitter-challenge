require 'peep'

describe Peep do
  describe "#all" do
    it "shows a list of all Peeps" do

      add_test_peeps
      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to have_text('Test peep 1')
      expect(peeps[1]).to have_content('Test peep 2')
      expect(peeps[2]).to have_content('Test peep 3')
    end
  end

  describe "#create" do
    it 'creates a new Peep' do
      peep = Peep.create(content: 'This is a peep')

      p peep
    end
  end
end
