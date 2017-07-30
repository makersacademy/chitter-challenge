describe Tag do
  subject(:tag) { described_class }
  name = "computing"
  let(:test_tag) { described_class.create(name: name) }

  it 'should have a name' do
    expect(test_tag.name).to eq name
  end
end
