require_relative './lib/peeps.rb'
require_relative './lib/user.rb'
require 'sinatra/base'
require 'pg'

class Chitter < Sinatra::Base
  enable :sessions

  get '/signin' do
   session[:username] = params[:username]
    erb :signin
  end

  get '/' do
    @name = session[:username]
    p ENV
    @peepmessage = Peep.all
    @username = User.all
    erb :index
  end

  get '/yourpeep' do
    erb :createpeep
  end

  post '/' do
    Peep.create(peep: params[:peep])
    # User.create(username: params[:username], password: params[:password])
    redirect '/'
  end

 run! if app_file == $0
end
