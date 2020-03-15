require 'peep'

describe Peep do
  describe '#posted_peeps' do
    it 'shows all peeps posted' do
      peeps = Peep.posted_peeps
      expect(page).to include("This a peep")
      expect(page).to include("Another peep")
      expect(page).to include("Never gets old")
    end
  end
end
