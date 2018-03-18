require "peep"
require "timeline"

describe Peep, '.post' do

  it 'creates a post with a message and an author' do
    msg = "Self absorbed garbage post"

    Peep.post(author: '@alfie', text: msg)

    peeps = Timeline.all
    result = peeps.map(&:text)
    expect(result).to include msg
  end

  it 'creates a post with a message and a different author' do
    msg = "Selling user data for cheap"

    Peep.post(author: '@alfie', text: msg)

    peeps = Timeline.all
    result = peeps.map(&:text)
    expect(result).to include msg
  end

end
