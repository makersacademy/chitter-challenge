require 'rake'
require 'pg'

describe 'rake tasks' do
  before(:all) do
    Rake.application.load_rakefile
  end

  describe 'db_exists?' do
    it 'returns true if a db exists' do
      expect(db_exists?('chitter')).to eq true
    end

    it 'returns false if a db doesnt exist' do
      expect(db_exists?('none')).to eq false
    end
  end

  describe 'create_test_db task' do
    it 'creates the chitter test db' do
      expect { Rake::Task['create_test_db'].execute }.not_to raise_error
    end
  end

  describe 'create_db task' do
    it 'creates the chitter db' do
      expect { Rake::Task['create_db'].execute }.not_to raise_error
    end
  end

  describe 'create_db' do
    it 'creates the specified db' do
      expect { create_db('new_db') }.not_to raise_error
      conn = PG.connect
      conn.exec("DROP DATABASE new_db")
      conn.close
    end
  end
end