require './lib/database'

if ENV['RACK'] = 'test'
  Database.setup('chitter_test')
else
  Database.setup('chitter')
end
