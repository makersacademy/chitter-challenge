# frozen_string_literal: true

require './lib/chitter.rb'

describe '.all ' do
  it 'returns the post objects from a database' do
    expect(Chitter.all).to include('I am the best president OF ALL TIME!')
  end
end

describe '.create' do
 it 'adds to database new content' do
  Chitter.create("My daughters are beautiful!")
   expect(Chitter.all).to include("My daughters are beautiful!")
 end
end
