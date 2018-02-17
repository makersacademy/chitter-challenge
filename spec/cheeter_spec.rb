require 'cheeter'

describe '.all' do
  it 'returns all the peeps in chronological order' do
    peeps = Peep.all
    texts = peeps.map(&:text)
    expect(text).to_include("Hello!, I'm having lunch.")
    expect(text).to_include("I'm enjoying a nice ice cream")
  end
end
