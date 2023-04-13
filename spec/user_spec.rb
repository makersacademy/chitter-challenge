require 'user'

RSpec.describe User do
  def reset_chitter_table
    seed_sql = File.read('spec/seeds.sql')
    connection = DatabaseConnection.connect('chitter_test')
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_chitter_table()
  end
  it "creates a new user" do
    new_user = User.new('Sofia Moore', 'TigerMoore', 'TigerStripedFox55@hotmail.com', 'wE8hN')
    expect(new_user.name).to eq 'Sofia Moore'
    expect(new_user.username).to eq 'TigerMoore'
    expect(new_user.email).to eq 'TigerStripedFox55@hotmail.com'
    expect(new_user.password).to eq 'wE8hN'
  end
end
