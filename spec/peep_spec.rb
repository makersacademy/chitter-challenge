describe Peep do 
  describe 'variables' do
    it 'stores variables' do 
      subject = Peep.new(1, 2, 3, 4, 5)
      expect(subject.id).to eq 1
      expect(subject.user_name).to eq 2
      expect(subject.real_name).to eq 3
      expect(subject.time_stamp).to eq 4
      expect(subject.body).to eq 5
    end
  end
end
