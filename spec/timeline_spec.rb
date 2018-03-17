require "timeline"

describe Timeline, '.all' do
  it 'displays all the peeps' do

    result = Timeline.all

    peep = result.map(&:text)

    expect(peep).to include('My first tweet!')
  end
end
