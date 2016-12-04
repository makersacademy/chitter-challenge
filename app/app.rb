ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require './app/models/user'
require './app/models/peep'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/sign_up' do
    erb :'sign_up'
  end

  post '/sign_up' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # post '/peeps' do
  #   peep = Peep.create(title: params[:title], body: params[:body])
  #   session[:user_id] = peep.id
  #   redirect to '/peeps'
  # end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps'
  end

run! if app_file == $0
end
