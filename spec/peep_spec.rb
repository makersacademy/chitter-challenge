require 'peep'
require 'database_helpers'
require 'users'

describe Peep do
  before do
    truncates
    add_test_users
  end

=begin
  it 'creates a new peep' do

    peep = Peep.create(text: 'This is a test peep', )

    persisted_data = persisted_data(table: :peeps, id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.text).to eq 'This is a test peep'
  end

  describe '.all' do
    let(:id) { 1 }

    it 'returns a list of peeps' do
      
      Peep.create(text: "This issss a test peep", user_id: :id)

      peep = Peep.all
      
      expect(peep.first).to be_a Peep
      expect(peep.first.id).to eq peep.id
      expect(peep.first.text).to eq "This issss a test peep"
    end
  end
=end

end
