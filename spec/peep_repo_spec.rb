require 'peep_repo'

def reset_tables
  seed_sql = File.read('spec/seeds/seeds.sql')
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
      expect(peeps[0]['timestamp']).to eq('2022-08-12 21:55:12 +0100')
      expect(peeps[0]['name']).to eq('Daffy Duck')
      expect(peeps[0]['username']).to eq('@daffy')

      expect(peeps[1]['id']).to eq('2')
      expect(peeps[1]['content']).to eq('Nice weather for ducks')
      expect(peeps[1]['timestamp']).to eq('2022-08-12 21:56:54 +0100')
      expect(peeps[1]['name']).to eq('Donald Duck')
      expect(peeps[1]['username']).to eq('@donald')
    end
  end

  context "create(peep)" do
    it "creates a peep" do
      new_peep = {
        content: 'Dogs chase squirrels',
        name: 'Suzy Sheep',
        username: '@suzy'
      }

      fake_time = double :time
      expect(fake_time).to receive(:now).and_return('2022-08-13 08:20:25 +0100')

      repo = PeepRepository.new(time = fake_time)
      repo.create(new_peep)

      peeps = repo.view_all
      expect(peeps.ntuples).to eq 3

      expect(peeps[2]['id']).to eq('3')
      expect(peeps[2]['content']).to eq('Dogs chase squirrels')
      expect(peeps[2]['timestamp']).to eq('2022-08-13 08:20:25 +0100')
      expect(peeps[2]['name']).to eq('Suzy Sheep')
      expect(peeps[2]['username']).to eq('@suzy')
    end

    it "fails if time is submitted" do
      new_peep = {
        content: 'Dogs chase squirrels',
        time: '2022-08-13 08:45:27',
        name: 'Suzy Sheep',
        username: '@suzy'
      }
      
      repo = PeepRepository.new
      expect { repo.create(new_peep) }.to raise_error "invalid peep submitted"
    end

    it "fails if a new_peep key is mislabelled" do
      new_peep = {
        contents: 'Dogs chase squirrels',
        name: 'Suzy Sheep',
        username: '@suzy'
      }

      repo = PeepRepository.new
      expect { repo.create(new_peep) }.to raise_error "invalid peep submitted"
    end

    it "fails if a new_peep key is blank or nil" do
      new_peep = {
        content: nil,
        name: '',
        username: '@suzy'
      }

      repo = PeepRepository.new
      expect { repo.create(new_peep) }.to raise_error "invalid peep submitted"
    end

    it "won't create a blank peep" do
      new_peep = {
        content: ' ',
        name: 'Suzy',
        username: '@suzy'
      }

      repo = PeepRepository.new
      expect { repo.create(new_peep) }.to raise_error "invalid peep submitted"
    end
  end
end
