require_relative '../lib/maker_repository'

def reset_name_table
  seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe MakerRepository do
  before(:each) do 
    reset_name_table
  end

  it "finds all makers" do
    repo = MakerRepository.new

    all_makers = repo.all

    expect(all_makers.length).to eq 2
    expect(all_makers.first.name). to eq "Chris"
  end

  it "creates a new maker" do
    repo = MakerRepository.new
    new_maker = Maker.new
    new_maker.name = "Olive"
    new_maker.username = 'OliBrolly'
    new_maker.email = 'olibrollywolly@email.com'
    new_maker.password = 'Ilikerain'

    repo.create(new_maker)

    expect(repo.all.length).to eq 3
    expect(repo.all[2].name).to eq 'Olive'
  end

  context "maker username exists in database" do
    it "returns true" do
      repo = MakerRepository.new
      new_maker = Maker.new
      new_maker.name = "Chris"
      new_maker.username = 'cast'
      new_maker.email = 'cast@email.com'
      new_maker.password = '123'

      expect(repo.maker_exists?(new_maker)).to eq true
    end
  end

  context "maker password exists in database" do
    it "returns true" do
      repo = MakerRepository.new
      new_maker = Maker.new
      new_maker.name = "Chris2"
      new_maker.username = 'cast2'
      new_maker.email = 'cast@email.com'
      new_maker.password = '1234'

      expect(repo.maker_exists?(new_maker)).to eq true
    end
  end

end
