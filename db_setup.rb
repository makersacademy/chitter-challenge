require './lib/connect_to_db'

if ENV['RACK_ENV'] == 'test'
    DBConnection.setup('chitter_test')
else
    DBConnection.setup('chitter_dev')
end 