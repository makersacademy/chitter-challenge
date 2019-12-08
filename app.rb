require 'sinatra/base'
require 'sinatra'
require 'sinatra/activerecord'
require './lib/peep'
require 'sinatra/flash'
require './database_connection_setup'


class ChitterApp < Sinatra::Base

  enable :sessions, :method_override
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/login' do
    session[:username] = params[:username]
    redirect '/peeps'
  end

  get '/peeps' do
    @username = session[:username]
    @peeps = Peep.all
    erb :'peeps/index'
  end

  get '/peeps/new' do
    @username = session[:username]
    @peeps = Peep.all
    erb :'peeps/new'
  end

  post '/peeps' do
    Peep.create(userid: session[:username], content: params[:content])
    redirect '/peeps'
  end


  run! if app_file == $0
end