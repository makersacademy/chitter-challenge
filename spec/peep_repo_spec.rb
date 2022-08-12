require 'bcrypt'
require 'peep_repo'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_tables
  end

  context "view peeps" do
    it "view_all" do
      repo = PeepRepository.new
      peeps = repo.view_all
      expect(peeps.ntuples).to eq 2
      expect(peeps[0]['id']).to eq('1')
      expect(peeps[0]['content']).to eq('It is awfully hot today')
      expect(peeps[0]['timestamp']).to eq('2022-08-12 21:55:12.940137 +0100')
      expect(peeps[0]['name']).to eq('Daffy Duck')
      expect(peeps[0]['username']).to eq('@daffy')
    end
  end
end
