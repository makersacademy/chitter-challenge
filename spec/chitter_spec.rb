# frozen_string_literal: true

require './spec/database_helper.rb'
describe '.all ' do
  it 'returns the post objects from a database' do
    add_test_data
    expect(Chitter.all.first).to be_an_instance_of(Chitter)
    expect(Chitter.all.length).to eq 3
    expect(Chitter.all.last.content).to include('Its freezing and snowing in New York--we need global warming!')
    expect(Chitter.all.last.time).to eq Time.now.strftime('%H:%M')
  end
end

describe '.create' do
  it 'adds to database new content' do
    Chitter.create('My daughters are beautiful!')
    expect(Chitter.all.first.content).to include('My daughters are beautiful!')
    expect(Chitter.all.first.time).to eq Time.now.strftime('%H:%M')
  end
end
