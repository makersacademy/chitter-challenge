describe Peep do

  let(:test_peep) { Peep.create(content: "This is an awesome tweet", created_at: "2016-09-11 16:48:24 +0100")}

  describe '#get_time' do

    it 'should retrieve and format time into a string' do
      expect(test_peep.get_time).to eq "Today, 16:48"

    end


  end

end
