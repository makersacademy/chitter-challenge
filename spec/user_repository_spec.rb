require_relative '../lib/user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_db_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_tables
  end

  it "allows the user to sign up, checking the email or username does not
  already exist" do

  repo = UserRepository.new
  repo.sign_up('Dave Jones', 'dave@madeup.com', 'BigDave', 'bigpassword')

  expect(repo.sign_up('Dave Jones', 'dave@madeup.com','BigDave', 'bigpassword')).to eq true
  end
end