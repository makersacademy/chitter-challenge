# require 'spec_helper'
# require 'database_helpers'
# require 'peep'

# describe '.delete' do
#   it 'deletes the given peep' do
#     peeps = Peep.create(message: 'Hello', name: 'Jo')
#     persisted_data = persisted_data(id: peep.id)

#     Peep.delete(id: peep.id)

#     expect(Peep.all.length).to eq 0
#   end
# end