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

  context '#all' do
    it "finds all makers" do
      repo = MakerRepository.new

      all_makers = repo.all

      expect(all_makers.length).to eq(2)
      expect(all_makers.first.name).to eq("Chris")
    end
  end

  context '#create(maker)' do
    it "creates a new maker" do
      repo = MakerRepository.new
      new_maker = Maker.new
      new_maker.name = "Olive"
      new_maker.username = 'OliBrolly'
      new_maker.email = 'olibrollywolly@email.com'
      new_maker.password = 'Ilikerain'

      repo.create(new_maker)

      expect(repo.all.length).to eq(3)
      expect(repo.all[2].name).to eq('Olive')
    end
  end

  context '#find_username_by_id(id)' do 
    it "returns maker username using id" do
      repo = MakerRepository.new
      maker_username = repo.find_username_by_id('1')

      expect(maker_username).to eq('cast')
    end
  end

  context '#find_name_by_id(id)' do 
    it "returns maker name using id" do
      repo = MakerRepository.new
      maker_username = repo.find_name_by_id('1')

      expect(maker_username).to eq('Chris')
    end
  end

  context '#find_id_by_username' do
    it 'returns id' do
      repo = MakerRepository.new
      maker_id = repo.find_id_by_username('cast')

      expect(maker_id).to eq('1')
    end
  end

  context '#maker_exists?(maker)' do
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
  end
  context '#password_match?(maker)' do
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

  context 'password_match?(maker)' do
    context 'maker password and username match' do
      it 'returns true' do
        repo = MakerRepository.new
        maker = Maker.new
        maker.name = "Chris"
        maker.username = 'cast'
        maker.email = 'cast@email.com'
        maker.password = '123'

        expect(repo.password_match?(maker)).to eq(true)
      end
    end
  
    context 'maker password and username do not match' do
      it 'returns false' do
        repo = MakerRepository.new
        maker = Maker.new
        maker.name = "Chris"
        maker.username = 'cast'
        maker.email = 'cast@email.com'
        maker.password = '1234'

        expect(repo.password_match?(maker)).to eq(false)
      end
    end
  end

  context '#login_status' do
    context 'initially' do
      it 'returns nil' do
        repo = MakerRepository.new

        expect(repo.login_status('1')).to eq(nil)
      end
    end

    context 'user logs in' do
      it 'returns "true"' do
        repo = MakerRepository.new
        repo.login('1')

        expect(repo.login_status('1')).to eq("true")
      end
    end

    context 'user logs out' do
      it 'returns nil' do
        repo = MakerRepository.new
        repo.logout('1')

        expect(repo.login_status('1')).to eq(nil)
      end
    end
  end
  context '#logged_in_user' do
    it 'returns true' do
      repo = MakerRepository.new
      repo.login('1')

      expect(repo.logged_in_maker_id).to eq('1')
    end
  end

  context '#logged_out_user' do
    it 'returns false' do
      repo = MakerRepository.new
      repo.logout('1')

      expect(repo.logged_in_maker_id).to eq('none')
    end
  end
end
