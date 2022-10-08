require "spec_helper"
require "rack/test"
require_relative '../lib/current_maker_repository'


def reset_tables
  peeps_seed_sql = File.read('spec/seeds/peeps_seeds.sql')
  makers_seed_sql = File.read('spec/seeds/makers_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(peeps_seed_sql)
  connection.exec(makers_seed_sql)
end

describe MakerHandler do
  before(:each) do 
    reset_tables
    reset_tables
  end
    
  include Rack::Test::Methods
  let(:app) { MakerHandler.new }

  context 'logged_in? method' do
    context 'initially' do
      it 'returns false' do
        maker_handler = MakerHandler.new

        expect(maker_handler.logged_in?).to eq(false)
      end
    end

    context 'Maker is logged in' do
      it 'returns true' do
        maker_handler = MakerHandler.new
        maker_handler.set_login_status(true)

        expect(maker_handler.logged_in?).to eq(true)
      end
    end
  end

  context 'return_id method' do
    context 'initially' do
      it 'returns nil' do
        maker_handler = MakerHandler.new

        expect(maker_handler.return_id).to eq(nil)
      end
    end
  end
end