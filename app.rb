require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/peep'
require_relative './lib/database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/add_peeps' do
    Peep.create(content: params['content'])
    redirect '/'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/add_user' do
    User.create(username: params['username'], name: params['name'], email: params['email'], password: params['password'])
    redirect '/'
  end

  run! if app_file == $0
end
