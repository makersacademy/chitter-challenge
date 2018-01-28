ENV["RACK_ENV"] ||= "development"

require 'sinatra'
require './app/models/peep'
require './app/models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
    @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @peeps = Peep.all
    erb :peeps
  end

  post '/' do
    Peep.create(body: params[:body], author: params[:author])
    redirect '/'
  end

  get '/new-peep' do
    erb :new_peep
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/new_user' do
    user = User.create(email: params[:email], username: params[:username],
    session[:user_id] = user.id
    redirect '/'
  end

end
