require 'user'

describe User do
  describe '#initialize' do
    subject {
      described_class.new(id: '1',
        name: 'Ash Ketchum',
        username: '@red',
        email: 'ash@pallet.com')
    }
    it "has an id" do
      expect(subject.id).to eq '1'
    end

    it "has a name" do
      expect(subject.name).to eq 'Ash Ketchum'
    end

    it "has a username" do
      expect(subject.username).to eq '@red'
    end

    it "has an email" do
      expect(subject.email).to eq 'ash@pallet.com'
    end
  end

end
