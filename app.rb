require 'sinatra/base'
require 'peep'

class Chitter < Sinatra::Base

  enable :sessions

  get '/chitter' do
    @peep = session[:peep]
    erb :index
  end

  post '/chitter' do
    session[:peep] = params['content']
    redirect '/chitter'
  end

  run! if app_file == $0

end
