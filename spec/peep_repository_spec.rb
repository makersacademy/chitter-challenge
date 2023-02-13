require_relative '../lib/peep.rb'
require_relative '../lib/peep_repository.rb'

RSpec.describe PeepRepository do
  before(:all) do
    @repo = PeepRepository.new
  end
  
  it 'finds all peeps' do

    peeps = @repo.all

    expect(peeps.length).to eq 6
    expect(peeps.first.id).to eq 1
    expect(peeps.first.content).to eq 'First Peep'
  end

end