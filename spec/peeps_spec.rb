RSpec.describe 'Peeps' do
  it 'creates a new peep' do 
    peep = Peeps.new(content: 'Hello')
    expect(peep.content).to eq 'Hello'
  end
end