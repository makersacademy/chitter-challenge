require 'peeps'
require '../database_helpers'

describe Peeps do
  it 'creates a peep with an id and message body' do
      my_peep = Peeps.new(id:1, message: 'This is a test')
      expect(my_peep).to be_instance_of Peeps
      expect(my_peep.id).to eq 1
      expect(my_peep.message).to eq 'This is a test'
  end

  it 'can create a peep via .create class method' do
    my_peep = Peeps.create(message: 'This is a test')
    expect(my_peep).to be_instance_of Peeps
    expect(my_peep.id).to eq '1'
    expect(my_peep.message).to eq 'This is a test'
  end

  it 'can view peeps via .all method' do
    my_peep = Peeps.create(message: 'This is a test')
    expect(Peeps.all).not_to be_empty
    expect(Peeps.all.first.message).to eq 'This is a test'
  end

  it 'can show date' do
    my_peep = Peeps.create(message: 'This is a test')
    expect(my_peep.date).to eq ("#{Time.new.strftime('%Y-%m-%d')}")
  end

  it 'can show time' do
    my_peep = Peeps.create(message: 'This is a test')
    persisted_data = persisted_data(time: my_peep.time, table: 'peeps')
    expect(my_peep.time).to eq persisted_data.first['time']
  end
end
