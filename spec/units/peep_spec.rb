require 'peep'

describe Peep do
  connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
  insertion = connection.exec("INSERT INTO peeps (user_id, posted_time, content) VALUES('45', current_timestamp, 'my demo tweet') RETURNING id, user_id, posted_time, content").first
  let(:username) { 'sandy974' }
  let(:demo_peep) { Peep.new(insertion['id'], username, insertion['posted_time'], insertion['content']) }

  it 'knows its id' do
    expect(demo_peep.id).to eq insertion['id']
  end
  it 'know who created it' do
    expect(demo_peep.username).to eq 'sandy974'
  end
  it 'has a creation timestamp' do
    expect(demo_peep.posted_time).to eq insertion['posted_time']
  end
  it 'know its content' do
    expect(demo_peep.content).to eq insertion['content']
  end
end
