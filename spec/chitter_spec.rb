require 'chitter'

describe Chitter do
  let(:message) { "First Tweet" }
  it 'receives a message' do
    expect(subject.add_message(message)).to include(message)
  end

  it 'returns a list of bookmarks' do
   chitter = Chitter.all

   expect(chitter).to include "First peep"
   expect(chitter).to include "Second peep"
   expect(chitter).to include "Third peep"
 end
end
