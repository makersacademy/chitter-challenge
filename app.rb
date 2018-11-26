require 'sinatra/base'
require_relative './lib/peeps'
require_relative './lib/users'
require './database_connection_setup'


class Chitter < Sinatra::Base

    enable :sessions

  get '/' do
    erb(:login)
  end

  get '/peeps' do
    @peeps = Peep.all
    @name = session[:name]
    erb(:index)
  end

  post '/peep' do
    Peep.post(message: params['message'])
    p Users.signup(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:name] = params[:name]
    redirect '/peeps'
  end

  run! if app_file == $0
end
