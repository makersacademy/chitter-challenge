require 'sinatra'
require 'sinatra/base'
require_relative './lib/db_connection'

class Chitter < Sinatra::Base

  DATABASES = {
    :prod => 'chitter',
    :dev => 'chitter_dev',
    :test => 'chitter_test'
  }
  ENV['ENVIRONMENT'] = 'dev' if ENV['ENVIRONMENT'] == nil
  DB = DATABASES[ENV['ENVIRONMENT'].to_sym]
  DbConnection.setup(DB)
  
  get '/' do
    "Chitter"
  end

  run! if app_file == $0
end