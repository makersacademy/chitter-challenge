require "timeline"

describe Timeline, '.all' do
  it 'displays all the peeps' do

    result = Timeline.all

    peep = result.map(&:text)

    expect(peep).to include('My first tweet!')
  end
end

describe Timeline, '.user' do
  it "displays a specific users tweets" do

    msg = "Buy our garbage! We got it for cheap"
    result = Timeline.user('@Amazon')

    peep = result.map(&:text)

    expect(peep).to include(msg)

  end
end
