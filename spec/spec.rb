describe Link do

  let(:link) { described_class.new }

  describe 'link' do
    it 'should exist' do
      expect(link).to be_an_instance_of(Link)
    end

    it 'should add a link' do
      expect{ Link.create(name: 'B', url: 'www.b.com') }.to change { Link.all.length }.by(1)
    end
  end
end
