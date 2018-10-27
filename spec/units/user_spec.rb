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

  describe '.create' do
    it "should add a new user to the db" do
      user = User.create(name: 'Gary Oak',
        username: '@blue',
        email: 'gary@pallet.com',
        password:'eevee123'
      )

      expect(user.name).to eq 'Gary Oak'
      expect(user.username).to eq '@blue'
      expect(user.email).to eq 'gary@pallet.com'
    end
  end
end
