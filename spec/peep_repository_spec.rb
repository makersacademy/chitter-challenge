require 'peep_repository'

describe PeepRepository do
  
  def reset_peeps_table
    seed_sql = File.read('spec/chitter_seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_base_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_peeps_table
  end

  context 'all' do
    it 'Should return all peeps from database' do
      repo = PeepRepository.new
      expect(repo.all.length).to eq(4)
      expect(repo.all.first.id).to eq(1)
      expect(repo.all.last.id).to eq(4)
      expect(repo.all[1].title).to eq('Hayleys peep')
      expect(repo.all[1].date_posted).to eq('2023-07-21 12:25:12')
    end
  end

  context 'Peeps by Maker' do
    it 'should only show peeps by selected Maker' do
      repo = PeepRepository.new
      expect(repo.by_maker(2).length).to eq (2)
      expect(repo.by_maker(2)[0].maker_id).to eq (2)
      expect(repo.by_maker(2)[0].content).to eq ('Another test peep')
    end
  end

  context 'peeps by title' do
    it 'Should select and return a peep from the database by its given title' do
      repo = PeepRepository.new
      selected = repo.find_by_title('Hayleys alternate peep')
      expect(selected.content).to eq ('peep to be deleted')
      expect(selected.maker_id).to eq (2)
    end
  end

  context 'create' do
    it 'Should add a new peep to the database' do
      repo = PeepRepository.new
      peep = double :peep, title: 'A double peep', content: 'double peeps content', date_posted: '2023-12-04 10:45:32', maker_id: 2
      repo.create(peep)
      expect(repo.all.last.content).to eq('double peeps content')
      expect(repo.all.last.date_posted).to eq('2023-12-04 10:45:32')
      expect(repo.all.length).to eq(5)
      expect(repo.all.last.id).to eq(5)
      expect(repo.all.last.maker_id).to eq(2)
    end
  end

  context 'delete' do
    it 'Should remove the row from the database that corresponds with passed id' do
      repo = PeepRepository.new
      repo.delete(1)
      expect(repo.all.length).to eq(3)
      expect(repo.all.first.id).to eq (2)
    end
  end
end
