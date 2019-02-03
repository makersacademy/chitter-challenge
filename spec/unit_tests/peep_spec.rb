require_relative '../helper.rb'

describe Peep do
  it 'returns all of the peeps' do
    expect(Peep.first.body).to eq 'First peep'
    expect(Peep.last.body).to eq 'Third peep'
  end

  it { should have_property :posted_at }
end
