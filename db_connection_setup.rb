# require './lib/db_connection'
#
# if ENV['ENVIRONMENT'] == 'test'
#   connection = DbConnection.setup('chitter_test')
# else
#   connection = DbConnection.setup('chitter')
# end

require './lib/db_connection'

if ENV['ENVIRONMENT'] == 'test'
  DbConnection.setup('chitter_test')
else
  DbConnection.setup('chitter')
end
