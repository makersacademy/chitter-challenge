# frozen_string_literal: true
require 'pg'
require './lib/chitter.rb'
require './spec/database_helper.rb'
describe '.all ' do
  it 'returns the post objects from a database' do
  
    
    add_test_data
    expect(Chitter.all.first).to be_an_instance_of(Chitter)
    expect(Chitter.all.length).to eq 3
  end
end

describe '.create' do
  it 'adds to database new content' do
 
    Chitter.create('My daughters are beautiful!')
    expect(Chitter.all.first.content).to include('My daughters are beautiful!')
  end
end
