# ./spec/features/peeps_spec.rb

require './lib/peeps'

describe '.show_mine' do
  it 'shows all peeps by myself' do
    DatabaseConnection.setup('chitter_test')
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES($1, $2, current_timestamp)",
    ['This is a test peep', 'DEV_TESTING']
    )
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES($1, $2, current_timestamp)",
    ['This is the second test peep.', 'DEV_TESTING']
    )
    DatabaseConnection.query(
      "INSERT INTO peeps (content, peeper, post_time) VALUES($1, $2, current_timestamp)",
    ['This is the third test peep.', 'DEV_TESTING']
    )
    result = Peeps.show_mine('DEV_TESTING')
    expect(result[0].content).to eq 'This is the third test peep.'
    expect(result[1].content).to eq 'This is the second test peep.'
    expect(result[2].content).to eq 'This is a test peep'
  end
end


describe '.create' do
  it 'creates new peeps' do
    Peeps.create('This is a test', 'DEV_TESTING')
    Peeps.create('This is the second test', 'DEV_TESTING')
    Peeps.create('This is a the last peep', 'DEV_TESTING')
    result = Peeps.show_mine('DEV_TESTING')
    expect(result[0].content).to eq 'This is a the last peep'
    expect(result[1].content).to eq 'This is the second test'
    expect(result[2].content).to eq 'This is a test'
  end
end