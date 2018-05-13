require './lib/database'

if ENV['ENVIRONMENT'] == 'test'
  Database.setup('chitter_test')
else
  Database.setup('chitter')
end
