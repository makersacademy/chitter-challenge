require_relative '../../app/models/tag'

describe Tag do
  describe 'Tag#parse_tags' do

    it "returns array of tags from Peep message" do
      expect(Tag.parse_tags("hvhvvbh#fbfj jnew #f32 fe")).to eq ["#fbfj", "#f32"]
    end

    it "returns an empty array if no tags are found" do
      expect(Tag.parse_tags("hvhvvdfkfjkrfjr fef ef44")).to eq []
    end
    
  end
end
