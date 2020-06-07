# frozen_string_literal: true
require 'pg'
require './lib/chitter.rb'
require './spec/database_helper.rb'
describe '.all ' do
  it 'returns the post objects from a database' do
    clear_table
    
    add_test_data
    expect(Chitter.all).to include('CNN is FAKE NEWS')
    p Chitter.all
    expect(Chitter.all.length).to eq 3 
  end
end

describe '.create' do
  it 'adds to database new content' do
    clear_table
    Chitter.create('My daughters are beautiful!')
    expect(Chitter.all).to include('My daughters are beautiful!')
  end
end
