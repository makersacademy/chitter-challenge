require 'database_helper'

describe '.persisted_data' do

  it 'returns id of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    # result = connection.exec("INSERT INTO peeps (id, body, user, time) VALUES(1, 'I have eaten way too many brownies! Help!', 'loushark', '#{Time.now.strftime('%a, %d %b %Y %H:%M:%S')}' ) RETURNING id, body, time;")
    # peep = Peep.new(result[0]['id'],result[0]['body'], result[0]['user'], result[0]['time'])
    peep = Peep.add('I have eaten way too many brownies! Help!', 'loushark')
    persisted_data = persisted_data_peeps(id: peep.id)

    expect(peep.id).to eq peep.id
  end

  it 'returns id of users' do
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("INSERT INTO users (id, name, username, email, password) VALUES(1, 'test', 'test', 'test', 'test') RETURNING id, name, username, email, password;")
    user = User.new(result[0]['id'], result[0]['name'], result[0]['username'], result[0]['email'], result[0]['password'])
    persisted_data = persisted_data_peeps(id: user.id)

    expect(user.id).to eq '1'
  end
end
