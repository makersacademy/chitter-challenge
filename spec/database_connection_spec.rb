require 'active_record'
require_relative '../database_connection.rb'

describe 'database_connection.rb' do
  it 'establishes connection with database' do
    expect(ActiveRecord::Base.connection.current_database).to eq 'chitterverse_test'
  end
end
