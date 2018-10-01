require 'sinatra/base'
require 'data_mapper'
require './lib/peep'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

DataMapper.finalize
DataMapper.auto_upgrade!

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'something secret'

  get '/' do
    @peeps = Peep.all
    erb(:peeps)
  end

  get '/add' do
    erb(:add)
  end

  post '/add' do
    Peep.create(text: params[:peep_text])
    redirect '/'
  end

end
