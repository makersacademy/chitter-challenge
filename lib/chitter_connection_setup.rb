require_relative 'chitter_connection'

if ENV['ENVIRONMENT'] == 'test'
  ChitterConnection.setup('chitter_test')
else
  ChitterConnection.setup('chitter')
end
