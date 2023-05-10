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
      content: "First post",
      time: '12:00:00',
      user_id: 1
    )
    formatter = Formatter.new
    result = formatter.format_peep(peep)

    expected_result = "
    Louis (lpc) says:<br/>
    First post<br/>
    - 12:00:00
    "

    expect(result).to eq expected_result

  end
end
