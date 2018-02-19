require 'cheeter'

describe '.all' do
  it 'returns all the peeps order' do
    peeps = Peep.all
    text = peeps.map(&:text)
    expect(text).to include("Hello, I am having lunch")
    expect(text).to include("enjoying my ice cream")
  end

describe '.add_peep' do
  it 'Adds peeps into to the end of cheeter database' do
    Peep.add_peep("enjoying coffee")
    peeps = Peep.all
    text = peeps.map(&:text)
    expect(text).to include 'enjoying coffee'
  end
end

end
