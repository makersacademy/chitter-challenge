require 'time_posted'

describe TimePosted do
  describe '.peep_post_time' do
    it 'is a time' do 
      expect(TimePosted.peep_post_time).to be_a Time 
    end
  end
end