require './lib/database'

if ENV['RACK_ENV'] == 'test'
  DataBase.connect('chitter_test')
else
  DataBase.connect('chitter')
end