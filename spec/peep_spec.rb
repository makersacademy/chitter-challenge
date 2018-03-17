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
    msg = "Buy our garbage! We got it for cheap"

    Peep.post(author: '@Amazon', text: msg)

    peeps = Timeline.all
    result = peeps.map(&:text)
    expect(result).to include msg
  end

end
