ENV["RACK_ENV"] ||= 'development'

require "sinatra/base"
require './app/models/peep'
require './app/models/user'
require_relative "helpers/dm_config"

class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/post-peep'
  end

  get '/homepage' do
    @peeps = Peep.all
    erb :homepage
  end

  get '/post-peep' do
    erb :post_peep
  end

  post '/posted-peep' do
    Peep.create(peep_content: params[:peep_content], time_peeped: Time.now)
    #Above will also have functionality to save username to peep.
    redirect '/homepage'
  end

  get '/signup' do
    erb :users_sign_up
  end

  post '/users' do
  user = User.create(email: params[:email],
              password: params[:password],
              name: params[:name],
              username: params[:username])
  session[:user_id] = user.id
  redirect to('/homepage')
end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
