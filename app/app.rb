ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'models/peep'
require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user])
    end
  end

  get '/' do
    erb :index, :layout => :layout
  end

  get '/new' do
    erb :new
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/peeps' do
    Peep.create(peep: params[:peep_content])
    redirect '/peeps'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username])
    session[:user] = user.id
    redirect '/'
  end

end
