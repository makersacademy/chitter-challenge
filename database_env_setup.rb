require_relative './lib/database_connection'

def database_setup
    if ENV['ENVIRONMENT'] = 'test'
        DatabaseConnection.setup('chitter_test')
    else 
        DatabaseConnection.setup('chitter')
    end

end