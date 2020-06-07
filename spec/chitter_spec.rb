
require './lib/chitter.rb'

describe '.all ' do
 it 'returns the post objects from a database' do
  expect(Chitter.all).to include('I am the best president OF ALL TIME!')
 end
end

