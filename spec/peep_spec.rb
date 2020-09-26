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
=end
end
