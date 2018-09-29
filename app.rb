require 'sinatra/base'

# DataMapper.setup(:default, 'postgres://user:password@hostname/database')

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @peep = [
      'Test Cheet One',
      'Test Cheet Two',
      'Test Cheet Three'
    ]
    erb :index
  end

  get '/peep' do
  end

  run! if app_file == $0
end
