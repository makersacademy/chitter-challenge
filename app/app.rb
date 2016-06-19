ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/chit'
require_relative 'data_mapper_setup'


class ChitterChallenge < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'index'
  end

  get '/chits' do
    @chits = Chit.all
    erb :'chits/index'
  end


  post '/sign_up' do
    user = User.create(username: params[:username],
                email: params[:email],
                name: params[:name],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/chits')
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
end


  run! if app_file == $0

end
