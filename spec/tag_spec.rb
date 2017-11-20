require './app/models/tag'

describe Tag do
  describe '#to_html' do
    subject { Tag.new(id: 1, name: 'tag') }

    context 'when converting to html' do
      it 'produces valid html' do
        expect(subject.to_html).to eq '<a class="tag" href="/tags/1">#tag</a>'
      end  
    end
  end
end
