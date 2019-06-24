require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/peep'
require_relative '.lib/user'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions, :method_override
  
  get '/' do
    @peeps = Peep.all
    @username = session[:username]
    erb :'peeps/index'
  end

  get '/new' do
    redirect '/new'
  end

  post '/new' do
    Peep.create(username: params[:username], text: params[:text])
    redirect '/'
  end

  get '/sign_in' do
    erb :sign_in
  end

  post '/sign_in' do
    User.create(username: params[:username], password: params[:password])
    session[:username] = params[:username]
    redirect '/'
  end

  
  run! if app_file == $0
end