describe Tag do
  subject(:tag)   { described_class                     }
  let(:name)      { "computing"                         }
  let(:test_tag)  { described_class.create(name: name)  }

  context '#name' do
    it 'returns string set' do
      expect(test_tag.name).to eq name
    end
  end
end
