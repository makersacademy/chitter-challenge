require 'peep_feed'

RSpec.describe PeepFeed do
  fake_result = [{ id: 1 }]
  let(:fake_peep) { double :Peep, new: nil }
  let(:fake_connection) { double :DatabaseConnection, query: fake_result }
  let(:fake_user) { double :User, user_details: { id: 1 } }
  subject do
    described_class.new(connection: fake_connection, peep_type: fake_peep)
  end

  it 'creates peep objects when getting peeps' do
    expect(fake_peep).to receive(:new)
    subject.get_peep(1)
  end

  it 'uses the database connection to get the peeps' do
    get_query = 'SELECT peeps.contents, peeps.timestamp, users.username FROM '\
      'peeps INNER JOIN users ON peeps.user_id = users.id WHERE peeps.id = '\
      '1;'
    expect(fake_connection).to receive(:query).with(get_query)
    subject.get_peep(1)
  end

  it 'can retrieve the most recent peeps' do
    top_query = 'SELECT peeps.id, peeps.contents, peeps.timestamp, '\
      'users.username FROM peeps INNER JOIN users ON peeps.user_id = users.id '\
      'ORDER BY peeps.timestamp DESC LIMIT 10'
    expect(fake_connection).to receive(:query).with(top_query)
    subject.top_peeps(10)
  end

  it 'can post peeps' do
    post_query = "INSERT INTO peeps(contents, user_id, timestamp) VALUES('"\
    "Hello, Chitter!', 1, NOW());"
    expect(fake_connection).to receive(:query).with(post_query)
    subject.post_peep(fake_user, 'Hello, Chitter!')
  end

  it 'can keep track of which peeps are replies' do
    reply_query = 'SELECT id FROM peeps WHERE user_id = 1 ORDER BY id DESC '\
    'LIMIT 1;'
    expect(fake_connection).to receive(:query).with(reply_query)
    subject.reply_peep(fake_user, "Hello to you too!", 2)
  end
end
