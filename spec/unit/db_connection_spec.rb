require './app/models/db_connection'

RSpec.describe DatabaseConnection do

  it 'confirms we connect to the correct database' do
    DatabaseConnection.setup
    expect(ActiveRecord::Base.connection.current_database).to eq 'chitter_test'
  end


end
