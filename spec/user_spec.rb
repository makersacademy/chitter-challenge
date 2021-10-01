require 'user'

describe User do
  it 'creates and saves a new user' do
    user = User.create(username: 'Test', email: 'test@example.com', password: 'test')
    expect(user).to be_a User
    expect(user.id).to eq PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE id = #{user.id};").first['id']
    expect(user.username).to eq 'Test'
    expect(user.email).to eq 'test@example.com'
    expect(user.created_at).to eq PG.connect(dbname: 'chitter_test').query("SELECT * FROM users WHERE created_at = '#{user.created_at}';").first['created_at']
  end
end
