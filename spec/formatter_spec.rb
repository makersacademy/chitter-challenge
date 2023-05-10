require 'formatter'

def reset_peeps_table
  seed_sql = File.read('spec/seeds/seeds_peeps.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_site_test' })
  connection.exec(seed_sql)
end

RSpec.describe Formatter do
  before(:each) do
    reset_peeps_table
  end

  it 'formats a peep into a nice post' do
    peep = double(
      :peep,
      content: 'First post',
      time: '12:00:00',
      user_id: 1,
      name: 'Louis',
      username: 'lpc'
    )
    formatter = Formatter.new
    result = formatter.format_peep(peep)

    expected_result = "
    Louis (<a href='users/1'>lpc</a>) says:<br/>
    First post<br/>
    - 12:00:00
    <br/>
    "

    expect(result).to eq expected_result
  end

  it 'formats a user into a display of their details' do
    user = double(
      :user,
      email: 'lou@chitter.com',
      name: 'Louis',
      username: 'lpc'
    )
    formatter = Formatter.new
    result = formatter.format_user(user)
    expected_result = "
    <h2>lpc</h2>
    <div>Louis, lou@chitter.com</div>
    <br/>
    "
    
    expect(result).to eq(expected_result)
  end
end
