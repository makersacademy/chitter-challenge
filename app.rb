require 'sinatra/base'
require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    erb(:peeps)
  end

  get '/add' do
    erb(:add)
  end

end
