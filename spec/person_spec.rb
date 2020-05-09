require 'person'

describe Person do 
  describe 'variables' do
    it 'saves variable' do
      subject = Person.new(1, 2, 3, 4, 5)
      expect(subject.id).to eq 1
      expect(subject.user_name).to eq 2
      expect(subject.real_name).to eq 3
      expect(subject.email).to eq 4
      expect(subject.password).to eq 5
      expect(subject.peeps).to eq []
    end
  end
end
