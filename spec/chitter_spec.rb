require_relative '../lib/chitter'
require 'database_helpers'

describe Chitter do
  # code omitted for brevity

describe '.all' do
  it 'returns a list of chitters' do
    connection = PG.connect(dbname: 'chitter_manager_test')
 
    # Add the test data
    chitter = Chitter.create(text: 'Hello everyone', message: 'Greeting')
    Chitter.create(text: 'Good to meet you', message: 'Appreciation')
    Chitter.create(text: 'Enjoy your day', message: 'Good Bye')
 
    chitters = Chitter.all
 
    expect(chitters.length).to eq 3
    expect(chitters.first).to be_a Chitter
    expect(chitters.first.id).to eq chitter.id
    expect(chitters.first.message).to eq 'Greeting'
    expect(chitters.first.text).to eq 'Hello everyone'
   end
 end

 describe '.create' do
  it 'creates a new chitter' do
    chitter = Chitter.create(text: 'Example', message: 'Test Chitter')
    persisted_data = persisted_data(id: chitter.id)

    expect(chitter).to be_a Chitter
    expect(chitter.id).to eq persisted_data['id']
    expect(chitter.message).to eq 'Test Chitter'
    expect(chitter.text).to eq 'Example'
    end
  end
end