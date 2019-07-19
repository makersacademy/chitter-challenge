require 'sinatra/base'
require_relative './models/peep'
require_relative './models/user'
# require_relative './models/chitter'

class ApplicationManager < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb(:index)
  end

  post '/post-peep' do
    Peep.add(params[:peep])
    redirect '/'
  end

  get '/users' do
    erb(:users)
  end

  post '/users/new' do
    User.add(params[:username], params[:email], params[:password])
    redirect '/'
  end

  run! if app_file == $0

end