require 'peep'

RSpec.describe Peep do
  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end

  it "creates new peep" do
    timestamp = '2023-04-11 21:23:03.916851'
    new_peep = Peep.new("TGIF everyone!", timestamp, 1)
    expect(new_peep.content).to eq "TGIF everyone!"
    expect(new_peep.time_of_posting).to eq timestamp
    expect(new_peep.user_id).to eq 1
  end
end
