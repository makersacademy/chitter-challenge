require 'peeps'

RSpec.describe Peeps do

  context '#post' do
    it "should post a peep" do
      Peeps.post('This is the test peep from RSpec', "Debora")
      expect(Peeps.all.first.text).to eq 'This is the test peep from RSpec'
    end
  end

end
