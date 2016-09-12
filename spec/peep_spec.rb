describe Peep do

  let(:test_peep) { Peep.create(content: "This is an awesome tweet", created_at: "2016-09-11 16:48:24 +0100")}
  let(:test_peep_2) { Peep.create(content: "This is an awesome tweet", created_at: "2016-04-21 11:00:24 +0100")}

  describe '#get_time' do

    it 'should retrieve and format time with a "today" in the string' do
      expect(test_peep.get_time).to eq "Sunday, Sep 11, 16:48"
    end

    it 'should retrieve and format time with a "Day, DD:MM, HH:MM" in string' do
      expect(test_peep_2.get_time).to eq "Thursday, Apr 21, 11:00"
    end


  end

end
