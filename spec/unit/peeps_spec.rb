require 'peeps'

RSpec.describe Peeps do

  before (:all) do
    test_configure
  end

  context '#post' do
    it "should post a peep" do
      Peeps.post('This is the test peep from RSpec')
      expect(Peeps.all.first.text).to eq 'This is the test peep from RSpec'
    end
  end

end
